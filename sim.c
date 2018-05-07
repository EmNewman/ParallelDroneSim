#include "pos.h"


#define DIRECTIONS 6
#define UP_WEIGHT 4
#define DOWN_WEIGHT 1
#define REG_WEIGHT 2
#define MAX_WEIGHT 4

#define Z_POS 4
#define Z_NEG 5


static inline int get_weight(int d) {
    if (d == Z_POS) {
        return UP_WEIGHT;
    } else if (d == Z_NEG) {
        return DOWN_WEIGHT;
    } else {
        return REG_WEIGHT;
    }

}

static int next_move(state_t *s, int drone_id) {
    grid_t* g = s->g;

    // TODO:
    // Calculate next step in optimal path around obstacles.
    // Move towards the goal.

    /* Algorithm:
     * Dijkstra's
     * Assign weights to nodes: up is 2, side-side is 1, down is 0.5
     *
     *
     *
     * Dial's:
     * Maintain buckets, numberd 0 through wV
     * w = max edge weight, V = vertices
     * Bucket k contains all temporarily labeled nodes with distance = k
     * Nodes in each bucket are represented by list of vertices
     * Buckets checked (sequentially) until first non-empty bucket found
     * Nodes with min dist. label are permanently labeled/deleted from bucket
     * position of temp labeled vertex in buckets is updated when dist. label of
     *      vertex changes
     * process repeated until all vertices permanently labeled
     *
     */
    //TODO protect against inf loops
    double total_direction_time = 0;
    double total_bucket_time = 0;
    // for now: do the naive way
    double start_time = currentSeconds();
    int start_node = s->drone_position[drone_id];
    int goal_node = s->drone_goal[drone_id];
    int cur_node = start_node;
    // mark all nodes as unvisited
    memset(s->unvisited_nodes, true, g->nnode * sizeof(bool));
    // set distance value to infinity
    //memset(s->node_dist_vals, -1, g->nnode * sizeof(int));
    int INF = s->max_buckets;
    for (int i = 0; i < g->nnode; i++) {
        s->node_dist_vals[i] = INF;
    }
    // preallocate bucket * nnode lists
    // TODO add to s
    //s->buckets[bucket_num][nnode]
    //s->bucket_counter[bucket_num]
    //s->bucket_index[bucket_num]
    //s->max_buckets


    // set start node to 0
    s->node_dist_vals[cur_node] = 0;
    // while goal has not been visited
    int cur_bucket = 0;
    s->buckets[0 + cur_node] = 1;
    s->bucket_counter[0] = 1;
    s->bucket_index[0] = cur_node;
    printf("Time initializing: %.4f\n", currentSeconds() - start_time);
    while (1) {
        double start_time2 = currentSeconds();
        // Check buckets until first non-empty bucket is found
        bool loop_exit = true;
        for (int i = 0; i < s->max_buckets; i++) {
            if (s->bucket_counter[i] != 0) {
                cur_bucket = i;
                loop_exit = false;
                //printf("1. cur-bucket and count: %d %d\n", cur_bucket, s->bucket_counter[i]);
                break;
            }
        }
        if (loop_exit) {
            break;
        }
        //printf("2. cur-bucket and count: %d %d\n", cur_bucket, s->bucket_counter[cur_bucket]);

        // Take first vertex from bucket.
        int cur_vertex = s->bucket_index[cur_bucket];
        //printf("cur_vertex: %d\n", cur_vertex);
        // Remove from bucket
        s->buckets[cur_bucket * g->nnode + cur_vertex] = 0;
        s->bucket_counter[cur_bucket]--;
        // current vertex is first index that isn't 0?
        //int cur_vertex = s->buckets[cur_bucket][index];
        //s->bucket_index[cur_bucket]++;

        // Process all adjacents of vertex cur_vertex, and update dist. if required
#if OMP
        # pragma omp parallel for
#endif
        for (int d = 0; d < DIRECTIONS; d++) {
            // get neighbor
            int nbr = calculate_neighbor(cur_vertex, (enum direction) d, g);
            if (nbr < 0 || nbr >= g->nnode) {
                continue;
            }
            int w = get_weight(d);

            //printf("cur_vertex, nbr: %d, %d\n", cur_vertex, nbr);
            int d_cur = s->node_dist_vals[cur_vertex];
            int d_nbr = s->node_dist_vals[nbr];
            //printf("d_cur, d_nbr, w: %d, %d, %d\n", d_cur, d_nbr, w);
            // if this is a shorter path
            if (d_nbr > d_cur + w) {
                // if d_nbr isn't INF then it must be in B[d_nbr] bucket, so
                // "erase" entry in bucket
                if (d_nbr != INF) {

                    s->buckets[d_nbr * g->nnode + nbr] = 0;
                    //s->buckets[d_nbr][nbr] = 0;
#if OMP
                    # pragma omp atomic
#endif
                    s->bucket_counter[d_nbr]--;
                }
                // update distance
                s->node_dist_vals[nbr] = d_cur + w;
                d_nbr = d_cur + w;
                // put nbr into updated distance bucket
                //s->buckets[d_nbr][nbr] = 1;
                //printf("index: %d\n", d_nbr*s->max_buckets + nbr);
                s->buckets[d_nbr * g->nnode + nbr] = 1;
#if OMP
                # pragma omp atomic
#endif
                s->bucket_counter[d_nbr]++;
                //printf("test\n");
                // "storing updated iterator in dist[v].second"???
                // unnecessary since we iterate thru DIRECTIONS on every node
            }
        }
        // update bucket_index
        // TODO ??
        total_direction_time += (currentSeconds() - start_time2);
        start_time2 = currentSeconds();
#if OMP
        #pragma omp parallel for schedule(auto)
#endif
        for (int b = 0; b < s->max_buckets; b++) {
            int node = 0;
            for (int j = 0; j < s->g->nnode; j++) {
                // s->buckets[b][j]
                if (s->buckets[b * g->nnode + j] != 0) {
                    node = j;
                    break;
                }
            }
            s->bucket_index[b] = node;
        }
        total_bucket_time += (currentSeconds() - start_time2);
    }
    double end_time = currentSeconds();
    printf("Time running Dial's: %.4f\n", end_time - start_time);
    printf("-----Time spent in directions: %.4f\n", total_direction_time);
    printf("-----Time spent in buckets: %.4f\n", total_bucket_time);
    //printf("end\n\n");
    // get the next move
    // iterate through all the neighbors of the goal, follow the minimum distance
    // find the edge where edgeweight(cur_node, nbr) + dist(nbr, goal) = dist(start_node, goal)
    int min_dist = INF;
    int min_node = start_node;
#if OMP
    # pragma omp parallel for
#endif
    for (int d = 0; d < DIRECTIONS; d++) {
        // find minimum value of dist(start, goal) - edge(start, neighbor)
        int w = get_weight(d);
        if (s->node_dist_vals[goal_node] - w < min_dist) {
            min_dist = s->node_dist_vals[goal_node] - w;
            min_node = calculate_neighbor(start_node, (enum direction) d, g);
        }
    }

    if (min_node == start_node) {
        printf("Couldn't find correct neighbor\n");
    }
    return min_node;

}


// TODO add next drone position
static void process_batch(state_t *s, int bstart, int bcount) {
    //grid_t* g = s->g;

    // Get next move towards the goal
    for (int drone_id = bstart; drone_id < bstart + bcount; drone_id++) {
        s->drone_position[drone_id] = next_move(s, drone_id);
    }

}

void run_step(state_t* s) {

    // Iterate through all drones
    // One by one for now?
    // Leave in process_batch just in case
    // for (int b = 0; b < s->num_drones; b+= batch_size;) {
    process_batch(s, 0, s->num_drones);
    //}
}

// TODO move to a diff. file?
void show () {

}


void simulate (state_t *s, int count, int dinterval, bool display) {
    /* Compute, show initial state */
    bool show_counts  = true;

    // I guess we should only display drone positions

    if (display)
        show(s, show_counts);
    // TODO write show

    for (int i=0; i<count; i++) {
        //printf("hi %d\n", OMP);
        run_step(s);

        // test: print all the drones and their goals

        int n = s->num_drones;
        for(int j = 0; j < n; j++) {
            printf("%d %d\n", s->drone_position[j], s->drone_goal[j]);
        }
        printf("\n");

        /*
        if (display) {
            show_counts = (((i + 1) % dinterval) == 0) || (i == count - 1);
            show(s, show_counts);
        }
        */
    }


}
