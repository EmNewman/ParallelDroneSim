#ifndef POS_H
/*
 * XYZ Position "class"
 * Allows for easy converting between the flattened index
 * and an XYZ coordinate
 */
#include "run.h"

typedef struct {
    int x_pos;
    int y_pos;
    int z_pos;
    int flat_index;
} pos_t;

/* Returns a struct based on the flattened index "index"
 * and the dimensions of g.
 */
pos_t create_pos(int index, grid_t *g);

/* Returns a flattened index based on the provided pos_t struct
 * and the dimensions of g.
 */
int flatten(pos_t p, grid_t *g);

/* All the possible directions. */
enum direction { X_POS, X_NEG, Y_POS, Y_NEG, Z_POS, Z_NEG };

/* Calculates the neighbor in the specified direction.
 * If is on an edge, returns -1.
 */
int calculate_neighbor(int index, enum direction d, grid_t *g);

/* Free the pos struct. */
void free_pos(pos_t *p);

#define POS_H
#endif /* POS_H */
