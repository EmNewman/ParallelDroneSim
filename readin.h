#ifndef READIN_H



#ifndef OMP
#define OMP 0
#endif

#ifndef MPI
#define MPI 0
#endif

#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <stdarg.h>
#include <ctype.h>
#include <math.h>

#if OMP
#include <omp.h>
#endif

#if MPI
#include <mpi.h>
#endif


typedef struct {
    int nnode;
    int x_dim;
    int y_dim;
    int z-dim;
} grid_t;

typedef struct {
    grid_t *g;

    int num_drones;
    // OMP threads
    int nthread;

    // Node ID for each drone. Length = num_drones
    int* drone_position;
    // Node ID for each drone goal. Length  num_drones
    int* drone_goal;
}

/* In readin.c */
void init();




void free_state();



