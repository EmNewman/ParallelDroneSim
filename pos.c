#include "pos.h"


/* Returns a struct based on the flattened index "index"
 * and the dimensions of g.
 */
// TODO maybe don't use heap mem???
// or if we have fixed amount of allocation, move it so it is reused
pos_t create_pos(int index, grid_t* g) {
    pos_t p;

    p.y_pos = index % g->x_dim;
    p.x_pos = (index / g->x_dim) % g->y_dim;
    p.z_pos = (index / g->x_dim) / g->y_dim;

    return p;
}


/* Returns a flattened index based on the provided pos_t struct
 * and the dimensions of g.
 */
// flattened = z * (x_dim * y_dim) + x*x_dim + y
int flatten(pos_t p, grid_t* g) {
    return p.z_pos * (g->x_dim * g->y_dim) + p.x_pos * g->x_dim + p.y_pos;
}

int calculate_neighbor(int index, enum direction d, grid_t* g) {
    pos_t p = create_pos(index, g);
    switch(d) {
        case X_POS :
            p.x_pos += 1;
            break;
        case X_NEG :
            p.x_pos -= 1;
            break;
        case Y_POS :
            p.y_pos += 1;
            break;
        case Y_NEG :
            p.y_pos -= 1;
            break;
        case Z_POS :
            p.z_pos += 1;
            break;
        case Z_NEG :
            p.z_pos -= 1;
            break;
    }
    if (p.x_pos < 0 || p.y_pos < 0 || p.z_pos < 0
     || p.x_pos > g->x_dim || p.y_pos > g->y_dim || p.z_pos > g->z_dim) {
        return -1;
    }
    return flatten(p, g);
}

/* Frees the pos struct. */
void free_pos(pos_t* p) {
    free(p);
}
