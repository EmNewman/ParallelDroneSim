DEBUG=0
CC=gcc
MPICC=mpicc
OMP=-fopenmp -DOMP
MPI=-DMPI
CFLAGS=-g -O3 -Wall -DDEBUG=$(DEBUG) -std=gnu11
LDFLAGS = -lm
DDIR = ./data

CFILES = run.c readin.c sim.c pos.c cycletimer.c binary-heap.c
HFILES = run.h pos.h cycletimer.h binary-heap.h

GFILES = benchmark.py

DFILES = testfile.drone

all: run run-omp

run: run-seq
	cp -p run-seq run

run-seq: $(CFILES) $(HFILES) $(XFILES)
	$(CC) $(CFLAGS) -o run-seq $(CFILES) $(LDFLAGS)

run-omp: $(Cfiles) $(HFILES)
	$(CC) $(CFLAGS) $(OMP) -o run-omp $(CFILES) $(LDFLAGS)
	$(CC) $(CFLAGS) $(OMP) -S -o sim-omp.s sim.c


clean:
	rm -f *~ *.pyc
	rm -rf *.dSYM
	rm -f *.tgz
	rm -f run run-seq
