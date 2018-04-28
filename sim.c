#include "pos.h"


#define DIRECTIONS 6
#define UP_WEIGHT 4
#define DOWN_WEIGHT 1
#define REG_WEIGHT 2

#define Z_POS  4
#define Z_NEG  5

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
     */
    //TODO protect against inf loops

    // for now: do the naive way
    int start_node = s->drone_position[drone_id];
    int goal_node = s->drone_goal[drone_id];
    int cur_node = start_node;
    // mark all nodes as unvisited
    memset(s->unvisited_nodes, true, g->nnode * sizeof(bool));
    // set distance value to infinity
    memset(s->node_dist_vals, -1, g->nnode * sizeof(int));
    // set start node to 0
    s->node_dist_vals[start_node] = 0;
    // while goal has not been visited
    while (s->unvisited_nodes[goal_node]) {
        //printf("hi\n");
        // consider all neighbors
        // x+1 x-1 y+1 y-1 z+1 z-1
        // no diagonals for now
        //printf("cur_node: %d\n", cur_node);
//#if OMP
//        #pragma omp parallel for
//#endif
        for (int i = 0; i < DIRECTIONS; i++) {
            int d = i;
            //printf("direction: %d\n", d);
            // TODO properly?
            // calculate tentative distances.
            int nbr = calculate_neighbor(cur_node, d, g);
            //printf("nbr: %d\n", nbr);
            if (nbr > 0) {

            }
            int tentative_dist;
            if (d == Z_POS) {
                tentative_dist = s->node_dist_vals[cur_node] + UP_WEIGHT;
            } else if (d == Z_NEG) {
                tentative_dist = s->node_dist_vals[cur_node] + DOWN_WEIGHT;
            } else {
                tentative_dist = s->node_dist_vals[cur_node] + REG_WEIGHT;
            }
            if (tentative_dist < s->node_dist_vals[nbr] || s->node_dist_vals[nbr] == -1) {
                s->node_dist_vals[nbr] = tentative_dist;
                //printf("tentative_dist:%d\n", tentative_dist);
            }
        }
        // mark as visited
        s->unvisited_nodes[cur_node] = false;

        // get minimum
        // TODO convert to an actual queue?
        if (s->unvisited_nodes[goal_node]) {
            int cur_min_dist = g->nnode + 1;
            int cur_min = 0;
//#if OMP
//            # pragma omp parallel for
//#endif
            for (int i = 0; i < g->nnode; i++)
            {
                if (s->unvisited_nodes[i])
                {
                    if (s->node_dist_vals[i] < cur_min_dist && s->node_dist_vals[i] != -1)
                    {
                      //#if OMP
                      //# pragma omp critical
                      //#endif
                      {
                      //printf("min 1??? %d\n", s->node_dist_vals[i]);
                      cur_min_dist = s->node_dist_vals[i];
                      cur_min = i;
                      }
                    }
                }
            }
            cur_node = cur_min;
        }
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
//#if OMP
//        #pragma omp parallel for
//#endif
        for (int i = 0; i < DIRECTIONS; i++) {
            enum direction d = i;
            int nbr = calculate_neighbor(cur_node, d, g);
            if (s->node_dist_vals[nbr] < min_w && s->node_dist_vals[nbr] != -1 && nbr != -1) {
                //printf("min? %d node: %d\n", s->node_dist_vals[nbr], cur_node);
                //#if OMP
                //# pragma omp critical
                //#endif
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
#if OMP
    # pragma omp parallel for schedule(auto)
#endif
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
