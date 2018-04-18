#ifndef RUN_H

#ifndef OMP
#define OMP 0
#endif

#ifndef MPI
#define MPI 0
#endif

#include <ctype.h>
#include <math.h>
#include <stdarg.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#if OMP
#include <omp.h>
#endif

#if MPI
#include <mpi.h>
#endif

#include "cycletimer.h"

/* Max line length for reading files */
#define MAXLINE 1024

typedef struct {
    int nnode;
    int x_dim;
    int y_dim;
    int z_dim;
} grid_t;

typedef struct {
    grid_t *g;

    int num_drones;
    // OMP threads
    int nthread;

    // Node ID for each drone. Length = num_drones
    int *drone_position;
    // Node ID for each drone goal. Length  num_drones
    int *drone_goal;
} state_t;

/****** In readin.c ******/

/* Print message on stderr */
void outmsg(char *fmt, ...);

/* Allocate and zero arrays of int */
int *int_alloc(size_t n);

/* Initialize the state of the function */
state_t *init();

/* Read in file */
bool read_input_file(state_t *s, grid_t *g, FILE *infile);

/* Simulate function */
void simulate(state_t* s, int steps, int dinterval, bool display);

#define RUN_H
#endif /* RUN_H */
