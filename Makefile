DEBUG=0
CC=gcc
MPICC=mpicc
OMP=-fopenmp -DOMP
MPI=-DMPI
CFLAGS=-g -O3 -Wall -DDEBUG=$(DEBUG) -std=gnu11
LDFLAGS = -lm
DDIR = ./data

CFILES = run.c readin.c cycletimer.c
HFILES = run.h cycletimer.h

all: run

run: run-seq
	cp -p run-seq run

run-seq: $(CFILES) $(HFILES) $(XFILES)
	$(CC) $(CFLAGS) -o run-seq $(CFILES) $(LDFLAGS)


clean:
	rm -f *~ *.pyc
	rm -rf *.dSYM
	rm -f *.tgz
	rm -f run run-seq
