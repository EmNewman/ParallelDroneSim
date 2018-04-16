#include "run.h"


/******** Some helper functions from the GraphRats simutil.c file *********/
void outmsg(char *fmt, ...) {
    va_list ap;
    bool got_newline = fmt[strlen(fmt) - 1] == '\n';
    va_start(ap, fmt);
    vfprintf(stderr, fmt, ap);
    va_end(ap);
    if (!got_newline)
        fprintf(stderr, "\n");
}

/* See whether line of text is a comment */
static inline bool is_comment(char *s) {
    int i;
    int n = strlen(s);
    for (i=0; i<n; i++) {
        char c = s[i];
        if (!isspace(c))
            return c == '#';
    }
    return false;
}

/* Allocate n ints and zero them out */
int* int_alloc(size_t n) {
    return (int*) calloc(n, sizeof(int));

void init() {
    // Allocate s, g
    state_t *s = malloc(sizeof(state_t));
    if (s == NULL) {
        outmsg("Couldn't allocate storage for state\n");
        return;
    }

    grid_t *g = malloc(sizeof(grid_t));
    if (g == NULL) {
        outmsg("Failed to allocate\n");
        return;
    }

    s->g = g;

    // TODO get input file

    read_input_file(s, g, infile);

}

// Allocate s and g outside of this fn
bool read_input_file(state_t* s, grid_t* g, FILE *infile) {
    char linebuf[MAXLINE];
    int num_drones;
    int nnode;
    int position;
    int goal;

    // Skip comments
    while(fgets(linebuf, MAXLINE, infile) != NULL) {
        if (!is_comment(linebuf))
            break;
    }

    // Get header info
    if (sscanf(linebuf, "%d %d %d %d",
                        &s->num_drones, &g->x_dim, &g->y_dim, &g->z_dim) != 4) {
        outmsg("ERROR [Line 1]: Malformed input file header.\n");
        return false;
    }
    g->nnode = g->x_dim * g->y_dim * g->z_dim;
    if (nnode != g->nnode) {
        outmsg("Graph contains %d nodes, but drone file has %d.\n", g->nnode, nnode);
        return false;
    }
    s->drone_goal = int_alloc(s->num_drones);
    ok = ok && s->drone_goal != NULL;
    s->drone_position = int_alloc(s->num_drones);
    ok = ok && s->drone_position != NULL;
    if (!ok) {
        outmsg("Couldn't allocate space for %d drones", s->num_drones);
        return false;
    }

    for (d = 0; d < num_drones; d++) {
        while(fgets(linebuf, MAXLINE, infile != NULL)) {
            if(!is_comment(linebuf))
            break;
        }
        if (sscanf(linebuf, "%d %d", &position, &goal) != 2) {
            outmsg("ERROR [Line %d]: Error in drone file.\n", d+2);
            return false;
        }
        if (position < 0 || position >= nnode) {
            outmsg("ERROR [Line %d]: Invalid position. %d\n", r+2, position);
            return false;
        }
        if (goal < 0 || goal >= nnode) {
            outmsg("ERROR [Line %d]: Invalid goal. %d\n", r+2, goal);
            return false
        }
        s->drone_position[d] = position;
        s->drone_goal[d] = goal;
    }

    outmsg("Loaded %d drones\n", num_drones);
    return true;
}





