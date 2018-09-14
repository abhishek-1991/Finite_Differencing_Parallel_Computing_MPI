all: p2_mpi.c
	mpicc -O3 -o p_mpi finite_differencing_mpi.c finite_differencing_func.c -lm

clean:
	rm -f *.o p_mpi
