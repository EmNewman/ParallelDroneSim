#include "binary-heap.h"
#include "pos.h"
#include "stdint.h"

#define DIRECTIONS 6
#define UP_WEIGHT 4
#define DOWN_WEIGHT 1
#define REG_WEIGHT 2

#define Z_POS 4
#define Z_NEG 5

#define OMP1 0
#define OMP2 0
#define OMP 0

struct vertex_dist {
    int distance;
    int vertex;
};

static int tuple_compare(void *arg1, void *arg2) {
    struct vertex_dist *t1 = arg1;
    struct vertex_dist *t2 = arg2;
    if (t1->distance == t2->distance)
        return 0;
    else if (t1->distance < t2->distance)
        return -1;
    else
        return 1;
}

static void pq_insert(BinaryHeap *pq, int distance, int vertex) {
    struct vertex_dist *tuple = malloc(sizeof(struct vertex_dist));
    tuple->distance = distance;
    tuple->vertex = vertex;
    binary_heap_insert(pq, tuple);
}

static int pq_pop(BinaryHeap *pq) {
    struct vertex_dist *tuple = binary_heap_pop(pq);
    int vertex = tuple->vertex;
    free(tuple);
    return vertex;
}

static int dir2weight(enum direction d)
{
    if (d == Z_POS) {
        return UP_WEIGHT;
    } else if (d == Z_NEG) {
        return DOWN_WEIGHT;
    } else {
        return REG_WEIGHT;
    }
}

static int dir2weight_rev(enum direction d)
{
    if (d == Z_POS) {
        return DOWN_WEIGHT;
    } else if (d == Z_NEG) {
        return UP_WEIGHT;
    } else {
        return REG_WEIGHT;
    }
}


static int next_move(state_t *s, int drone_id) {
    grid_t *g = s->g;

    int start_node = s->drone_position[drone_id];
    int goal_node = s->drone_goal[drone_id];

    // Mark all nodes as unvisited
    for (int i = 0; i < g->nnode; i++)
    {
        s->unvisited_nodes[i] = true;
        s->node_dist_vals[i] = 4 * g->nnode;
    }
    // Set start node distance to 0
    s->node_dist_vals[start_node] = 0;

    BinaryHeap *pq = binary_heap_new(BINARY_HEAP_TYPE_MIN, &tuple_compare);
    pq_insert(pq, 0, start_node);

    while (s->unvisited_nodes[goal_node] && binary_heap_num_entries(pq) > 0) {
        // printf("Binary_heap_num_entries: %d\n", binary_heap_num_entries(pq));
        int cur_node;

        // Get the next closest vertex
        do {
            cur_node = pq_pop(pq);
        } while (binary_heap_num_entries(pq) > 0 &&
                 !s->unvisited_nodes[cur_node]);
        if (!s->unvisited_nodes[cur_node])
            break;

        // printf("Dijkstra's Cur node: %d\n", cur_node);

        // For each neighbor of cur_node
        // x+1 x-1 y+1 y-1 z+1 z-1
        // no diagonals for now
        for (int i = 0; i < DIRECTIONS; i++) {
            enum direction d = i;
            // printf("direction: %d\n", d);
            int nbr = calculate_neighbor(cur_node, d, g);
            // printf("nbr: %d\n", nbr);
            if (nbr < 0) {
                // If there's no neighbor, skip this loop iteration
                continue;
            }
            // Calculate tentative distances.
            int tentative_dist = s->node_dist_vals[cur_node] + dir2weight(d);
            // printf("tentative_dist: %d\n", tentative_dist);

            // If we improve on the previous distance (or if it was infinity)
            // Update it.
            if (tentative_dist < s->node_dist_vals[nbr]) {
                // printf("Adding!!!\n");
                s->node_dist_vals[nbr] = tentative_dist;
                // printf("tentative_dist:%d\n", tentative_dist);

                pq_insert(pq, tentative_dist, nbr);
            }
        }
        // mark as visited
        s->unvisited_nodes[cur_node] = false;
    }

    // printf("Distances calculated!\n");

    // get the next move
    // iterate through all the neighbors of the goal, follow the minimum
    // distance
    int result_pos = 0;
    int cur_node = goal_node;
    while (cur_node != start_node) {
        // printf("cur_node backtracking: %d\n", cur_node);
        int prev_node = cur_node;
        for (int i = 0; i < DIRECTIONS; i++) {
            enum direction d = i;
            int nbr = calculate_neighbor(cur_node, d, g);
            // printf("nbr backtracking: %d\n", nbr);
            // if (nbr == 0)
            // {
                // printf("s->node_dist_vals[nbr] = %d\n", s->node_dist_vals[nbr]);
                // printf("dir2weight_rev(d) = %d\n", dir2weight_rev(d));
                // printf("s->node_dist_vals[cur_node] = %d\n", s->node_dist_vals[cur_node]);
            // }
            if (nbr != -1 &&
                s->node_dist_vals[nbr] + dir2weight_rev(d) == s->node_dist_vals[cur_node])
                {
                    cur_node = nbr;
                    break;
                }
            }

        if (cur_node == start_node) {
            result_pos = prev_node;
        }
    }

    return result_pos;
}

// TODO add next drone position
static void process_batch(state_t *s, int bstart, int bcount) {
    // grid_t* g = s->g;

    // Get next move towards the goal
    /*
#if OMP2
    # pragma omp parallel for schedule(auto)
#endif
*/
    for (int drone_id = bstart; drone_id < bstart + bcount; drone_id++) {
        printf("Finding next move of drone_id: %d\n", drone_id);
        s->drone_position[drone_id] = next_move(s, drone_id);
    }
}

void run_step(state_t *s) {

    // Iterate through all drones
    // One by one for now?
    // Leave in process_batch just in case
    // for (int b = 0; b < s->num_drones; b+= batch_size;) {
    process_batch(s, 0, s->num_drones);
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

    for (int i = 0; i < count; i++) {
        // printf("hi\n");
        run_step(s);

        // test: print all the drones and their goals

        int n = s->num_drones;
        for (int j = 0; j < n; j++) {
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
