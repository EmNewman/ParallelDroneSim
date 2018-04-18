#include <getopt.h>

#include "run.h"

static void usage(char *name) {
    char *use_string = "-f INFILE [-n STEPS] [-q] [-i INT] [-t THD]";
    outmsg("Usage: %s %s\n", name, use_string);
    outmsg("   -h        Print this message\n");
    outmsg("   -f INFILE Input file\n");
    outmsg("   -n STEPS  Number of simulation steps\n");
    outmsg("   -q        Operate in quiet mode.  Do not generate simulation "
           "results\n");
    outmsg("   -i INT    Display update interval\n");
    outmsg("   -t THD    Set number of threads\n");
    // done();
    exit(0);
}

int main(int argc, char *argv[]) {
    FILE *file = NULL;
    int steps = 1;
    int dinterval = 1;
    int c;
    state_t *s = NULL;
    bool display = true;
    int thread_count = 1;

    char *optstring = "hf:n:i:qt:";
    while ((c = getopt(argc, argv, optstring)) != -1) {
        switch (c) {
        case 'h':
            usage(argv[0]);
            break;
        case 'f':
            file = fopen(optarg, "r");
            if (file == NULL) {
                outmsg("Couldn't open input file %s\n", optarg);
                // done();
                exit(1);
            }
            break;
        case 'n':
            steps = atoi(optarg);
            break;
        case 'q':
            display = false;
            break;
        case 'i':
            dinterval = atoi(optarg);
            break;
        case 't':
            thread_count = atoi(optarg);
            break;
        default:
            outmsg("Unknown option '%c'\n", c);
            usage(argv[0]);
            // done();
            exit(1);
        }
    }
    if (file == NULL) {
        outmsg("Need input file\n");
        usage(argv[0]);
    }

    outmsg("Running with %d threads\n", thread_count);

    s = init(file);
    if (s == NULL) {
        //done();
        exit(1);
    }



    s->nthread = thread_count;
    double start = currentSeconds();
    simulate(s, steps, dinterval, display);
    double delta = currentSeconds() - start;
    outmsg("%d steps, %d drones, %.3f seconds\n", steps, s->num_drones, delta);

    return 0;
}

