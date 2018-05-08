#include "pos.h"

#define DIRECTIONS 6
#define UP_WEIGHT 4
#define DOWN_WEIGHT 1
#define REG_WEIGHT 2
#define MAX_WEIGHT 4

#define Z_POS 4
#define Z_NEG 5

#define ITERS 100

static inline int get_weight(int d) {
    if (d == Z_POS) {
        return UP_WEIGHT;
    } else if (d == Z_NEG) {
        return DOWN_WEIGHT;
    } else {
        return REG_WEIGHT;
    }
}

static inline int dir2weight_rev(int d) {
    if (d == Z_POS) {
        return DOWN_WEIGHT;
    } else if (d == Z_NEG) {
        return UP_WEIGHT;
    } else {
        return REG_WEIGHT;
    }
}

static int next_move(state_t *s, int drone_id, double *bench_time) {
    grid_t *g = s->g;

    // TODO:
    // Calculate next step in optimal path around obstacles.
    // Move towards the goal.

    /* Algorithm:
     *
     * Dial's:
     * Maintain buckets, numbered 0 through wV
     * w = max edge weight, V = vertices
     * Bucket k contains all nodes with distance = k
     * Nodes in each bucket are represented by list of vertices
     * Buckets checked (sequentially)
     * Nodes with min dist. label are permanently labeled/deleted from bucket
     * position of temp labeled vertex in buckets is updated when dist. label of
     *      vertex changes
     * process repeated until all vertices permanently labeled
     *
     */
    // TODO protect against inf loops
    // for now: do the naive way
    double start_time = currentSeconds();

    int start_node = s->drone_position[drone_id];
    int goal_node = s->drone_goal[drone_id];

for (int iters = 0; iters < ITERS; iters++) {
    // mark all nodes as unvisited
    if (goal_node == start_node) {
        return goal_node;
    }
    // memset(s->unvisited_nodes, true, g->nnode * sizeof(bool));
    // set distance value to infinity
    // memset(s->node_dist_vals, -1, g->nnode * sizeof(int));
    int INF = s->max_buckets;
#if OMP
#pragma omp parallel for
#endif
    for (int i = 0; i < g->nnode; i++) {
        s->node_dist_vals[i] = INF;
        s->unvisited_nodes[i] = true;
    }

#if OMP
#pragma omp parallel for
#endif
    for (int i = 0; i < s->max_buckets; i++) {
        s->bucket_counter[i] = 0;
    }

    // set start node to 0
    s->node_dist_vals[start_node] = 0;
    // while goal has not been visited
    s->buckets[0] = start_node;
    s->bucket_counter[0] = 1;
    int nodes_seen = 0;
    // printf("Time initializing: %.4f\n", currentSeconds() - start_time);
    for (int bucket = 0; bucket < s->max_buckets; bucket++)
    {
        // printf("Dealing with bucket %d\n", bucket);
        // printf("There are %d nodes in this bucket\n", s->bucket_counter[bucket]);
        nodes_seen += s->bucket_counter[bucket];
#if OMP
#pragma omp parallel for
#endif
        for (int i = bucket * g->nnode;
             i < bucket * g->nnode + s->bucket_counter[bucket]; i++) {
            int cur_vertex = s->buckets[i];
            // printf("cur_vertex: %d\n", cur_vertex);
            // If we've already encountered this node before...
            if (!s->unvisited_nodes[cur_vertex])
                continue;
            s->unvisited_nodes[cur_vertex] = false;

            // Loop over neighbors
            for (int d = 0; d < DIRECTIONS; d++) {
                int nbr = calculate_neighbor(cur_vertex, (enum direction)d, g);
                // printf("nbr in dials: %d\n", nbr);

                // If there's no vertex in this direction, or if it's already
                // been visited
                if (nbr < 0 || nbr >= g->nnode || !s->unvisited_nodes[nbr]) {
                    continue;
                }

                int tentative_dist = s->node_dist_vals[cur_vertex] +
                                     get_weight(d);
                // printf("tentative_dist: %d\n", tentative_dist);
                int current_dist;
                while (tentative_dist < (current_dist = s->node_dist_vals[nbr]))
                {
#if OMP
                    bool swap =__sync_bool_compare_and_swap(
                        s->node_dist_vals + nbr,
                        current_dist, tentative_dist);

                    if (swap)
                    {
                        int dest = __sync_fetch_and_add(s->bucket_counter + tentative_dist, 1);
                        s->buckets[g->nnode * tentative_dist + dest] = nbr;
                    }
#else
                    s->node_dist_vals[nbr] = tentative_dist;

                    s->buckets[g->nnode * tentative_dist +
                               s->bucket_counter[tentative_dist]] = nbr;
                    s->bucket_counter[tentative_dist]++;
#endif
                }
            }
        }
    }
    // printf("Nodes seen: %d\n", nodes_seen);
    // for (int i = 0; i < g->nnode; i++)
    //   printf("Node %d has distance %d\n", i, s->node_dist_vals[i]);

}
    double end_time = currentSeconds();
    *bench_time += end_time - start_time;
    // printf("Time running Dial's: %.4f\n", end_time - start_time);

    int prev_node = 0;
    int cur_node = goal_node;
    while (cur_node != start_node) {
        prev_node = cur_node;
        // printf("cur_node: %d\n", cur_node);
        for (int i = 0; i < DIRECTIONS; i++) {
            enum direction d = i;
            int nbr = calculate_neighbor(cur_node, d, g);
            // printf("nbr: %d\n", nbr);
            // printf("s->node_dist_vals[nbr]: %d\n", s->node_dist_vals[nbr]);
            // printf("s->node_dist_vals[cur_node]: %d\n", s->node_dist_vals[cur_node]);
            if (nbr != -1 &&
                s->node_dist_vals[nbr] + dir2weight_rev(d) == s->node_dist_vals[cur_node])
                {
                    cur_node = nbr;
                    break;
                }
        }
        // When cur_node == start_node, prev_node is the node we want to return
    }

    return prev_node;
}

// TODO add next drone position
static double process_batch(state_t *s, int bstart, int bcount) {
    // grid_t* g = s->g;

    double total_bench_time = 0.0;
    // Get next move towards the goal
    for (int drone_id = bstart; drone_id < bstart + bcount; drone_id++) {
        int goal_node = s->drone_goal[drone_id];
        if (s->drone_position[drone_id] == goal_node);
            // printf("Drone %d has reached goal\n", drone_id);
        else
        {
            // printf("Finding next move of drone_id: %d\n", drone_id);
            s->drone_position[drone_id] = next_move(s, drone_id, &total_bench_time);
        }
    }

    return total_bench_time;
}

double run_step(state_t *s) {

    // Iterate through all drones
    // One by one for now?
    // Leave in process_batch just in case
    // for (int b = 0; b < s->num_drones; b+= batch_size;) {
    return process_batch(s, 0, s->num_drones);
    //}
}

// TODO move to a diff. file?
void show() {}

void simulate(state_t *s, int count, int dinterval, bool display) {
    /* Compute, show initial state */
    bool show_counts = true;

    // I guess we should only display drone positions

    if (display)
        show(s, show_counts);
    // TODO write show

    double total_total_bench_time = 0.0;

    for (int i = 0; i < count; i++) {
        // printf("hi %d\n", OMP);
        total_total_bench_time += run_step(s);

        // test: print all the drones and their goals

        int n = s->num_drones;
        for (int j = 0; j < n; j++) {
            printf("%d %d\n", s->drone_position[j], s->drone_goal[j]);
        }
        printf("\n");

        bool done = true;
        for (int d = 0; d < s->num_drones; d++) {
            done = done && (s->drone_position[d] == s->drone_goal[d]);
        }
        if (done) {
            printf("Total time taken: %f\n", total_total_bench_time);
            printf("DONE!!! in %d steps\n", i);
            return;
        }

        /*
        if (display) {
            show_counts = (((i + 1) % dinterval) == 0) || (i == count - 1);
            show(s, show_counts);
        }
        */
    }
}
