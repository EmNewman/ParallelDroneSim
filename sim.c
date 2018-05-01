#include "pos.h"
#include "binary-heap.h"
#include "stdint.h"


#define DIRECTIONS 6
#define UP_WEIGHT 4
#define DOWN_WEIGHT 1
#define REG_WEIGHT 2

#define Z_POS  4
#define Z_NEG  5

#define OMP1 0
#define OMP2 0
#define OMP 0

static const int64_t mask = 0xFFFFFFFF;

// We store the priority in the top 32 bits and the vertex id in the lower bits
static int int_compare(BinaryHeapValue value1, BinaryHeapValue value2)
{
  int32_t priority1 = (value1 >> 32) & mask;
  int32_t priority2 = (value2 >> 32) & mask;
  if (priority1 < priority2)
    return -1;
  else if (value1 == value2)
    return 0;
  else
    return 1;
}

static int next_move(state_t *s, int drone_id) {
    grid_t* g = s->g;

    // TODO:
    // Calculate next step in optimal path around obstacles.
    // Move towards the goal.

    /* Algorithm:
     * Dijkstra's
     * Assign weights to nodes: up is 2, side-side is 1, down is 0.5
     */
    //TODO protect against inf loops

    // for now: do the naive way
    int start_node = s->drone_position[drone_id];
    int goal_node = s->drone_goal[drone_id];

    // Mark all nodes as unvisited
    memset(s->unvisited_nodes, true, g->nnode * sizeof(bool));
    // Set distance value to infinity
    memset(s->node_dist_vals, -1, g->nnode * sizeof(int));
    // set start node to 0
    s->node_dist_vals[start_node] = 0;

    BinaryHeap *pq = binary_heap_new(BINARY_HEAP_TYPE_MIN, &int_compare);
    binary_heap_insert(pq, 0);

    while (s->unvisited_nodes[goal_node]) {
        //printf("hi\n");
        // consider all neighbors
        // x+1 x-1 y+1 y-1 z+1 z-1
        // no diagonals for now
        //printf("cur_node: %d\n", cur_node);
        // Dequeue here
        int cur_node;

        // Get the next closest vertex
        while (binary_heap_num_entries(pq) > 0
            && !s->unvisited_nodes[cur_node])
            cur_node = binary_heap_pop(pq) & mask;
        if (!s->unvisited_nodes[cur_node])
            break;

        // For each neighbor of cur_node
        for (int d = 0; d < DIRECTIONS; i++) {
            //printf("direction: %d\n", d);
            int nbr = calculate_neighbor(cur_node, d, g);
            //printf("nbr: %d\n", nbr);
            if (nbr < 0) {
                // If there's no neighbor, skip this loop iteration
                continue;
            }
            // calculate tentative distances.
            int tentative_dist;
            // Add to queue
            if (d == Z_POS) {
                tentative_dist = s->node_dist_vals[cur_node] + UP_WEIGHT;
            } else if (d == Z_NEG) {
                tentative_dist = s->node_dist_vals[cur_node] + DOWN_WEIGHT;
            } else {
                tentative_dist = s->node_dist_vals[cur_node] + REG_WEIGHT;
            }

            // If we improve on the previous distance (or if it was infinity)
            // Update it.
            if (tentative_dist < s->node_dist_vals[nbr] ||
                s->node_dist_vals[nbr] == -1) {
                s->node_dist_vals[nbr] = tentative_dist;
                // printf("tentative_dist:%d\n", tentative_dist);

                binary_heap_insert(pq, tentative_dist << 32 || nbr);
            }
        }
        // mark as visited
        s->unvisited_nodes[cur_node] = false;
    }

    // get the next move
    // iterate through all the neighbors of the goal, follow the minimum distance
    int result_pos = 0;
    cur_node = goal_node;
    while (cur_node != start_node) {
        //printf("cur_node 2: %d\n", cur_node);
        int prev_node = cur_node;
        int min_w = g->nnode+1;
        int min_nbr = 0;
/*#if OMP1
        #pragma omp parallel for schedule(auto)
#endif
*/
        for (int i = 0; i < DIRECTIONS; i++) {
            enum direction d = i;
            int nbr = calculate_neighbor(cur_node, d, g);
            if (s->node_dist_vals[nbr] < min_w && s->node_dist_vals[nbr] != -1 && nbr != -1) {
                //printf("min? %d node: %d\n", s->node_dist_vals[nbr], cur_node);
                /*#if OMP1
                # pragma omp critical
                #endif
                */
                {
                min_w = s->node_dist_vals[nbr];
                min_nbr = nbr;
                }
                //printf("minimum: %d at node: %d\n", min_w, min_nbr);
            }
        }

        cur_node = min_nbr;
        if (cur_node == start_node) {
            result_pos = prev_node;
            //printf("done\n");
        }

    }

    return result_pos;
}


// TODO add next drone position
static void process_batch(state_t *s, int bstart, int bcount) {
    //grid_t* g = s->g;

    // Get next move towards the goal
    /*
#if OMP2
    # pragma omp parallel for schedule(auto)
#endif
*/
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
        printf("hi\n");
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
