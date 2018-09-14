Project Title: Given a certain function find the GRID point between 0 and 100 and Using MPI Calculate the value of the function at those grid points as well their Derivatives.

Introduction: In this project a function is provided and we have to calculate its derivative using finite differential method. The value of the function and its derivative is to be calculated from its grid point which will be cut from range 1-100.
Also, we have to measure the performance of the program in various modes like the Message passing call are blocking, non-blocking and when Collective function call is used. Result from Grid point and function value will be store in data file and the same file will
Be later used to plot the graph of derivate along with its function using gnu plot.

PREQUISTIES: A compiler capable of compiling MPI program and a multi core processor to run the program

Solution: This project could me implemented by dividing it into smaller parts based on the following steps:
1. Divide the grid point into smaller chunks based on the number of processor unit available.
2. Calculate the points by dividing the range into number of grid points.
3. Calculate the function value and each of the point in sub-grid that the process possessing.
4.  Calculate the function derivative and each of the function value point in sub-grid that the process possessing.
5. Measure the time for each variation of the input
6. And dump the result of point, value and derivative to a file.

How to Run the program:
Get the number of processor using srun Command from the arc cluster.
E.g. : srun -N4 -n 4 -p opteron --pty /bin/bash
1. Copy the below file to the working directlory

2. Compile the code using Make file
$ make -f p2.Makefile

3. To run the program 
$ prun ./p2_mpi <number of grid points> <point_to_point_com mode> <gather/manual gather mode>
e.g:  prun ./p2_mpi 10 1 1

Files submitted:
1. p2_mpi.c
2. p2.Makefile
3. p2_func.c
4. p2.README
5. fn-100.png
6. fn-1000.png
7. fn-10000.png

Results:
The below results are calculated for sin(x) function.
Comparison between Execution time of Blocking and Non-Blocking and MPI_Gather function call:

Number_Of_Nodes	GRID_Value		MPI_Gather	Blocking	Non-Blocking
1				100				0.002516	0.002199	0.00265
1				1000			0.009574	0.008566	0.009099
1				10000			0.039052	0.037003	0.038499
2				100				0.003585	0.003005	0.003208
2				1000			0.015889	0.00814		0.008462
2				10000			0.040112	0.037854	0.037805
3				100				0.003585	0.003005	0.003208
3				1000			0.015889	0.00814		0.008462
3				10000			0.040112	0.037854	0.037805
4				100				0.00643		0.554301	0.004753
4				1000			0.011705	0.012062	0.012553
4				10000			0.036733	0.037803	0.037703
5				100				0.004918	0.008539	0.006983
5				1000			0.015694	0.011359	0.012121
5				10000			0.042295	0.040053	0.035902
6				100				0.010115	0.007451	0.006754
6				1000			0.012408	0.012515	0.014057
6				10000			0.036493	0.035758	0.03835
7				100				0.012533	0.011872	0.006318
7				1000			0.013361	0.013394	0.012753
7				10000			0.036592	0.039081	0.038978
8				100				0.006581	0.009545	0.009598
8				1000			0.015121	0.013572	0.011303
8				10000			0.037993	0.037383	0.036928

Inference 1:
It could be observed from the above table that for the same number of nodes MPI Blocking gives better performance from the other two.

Inference 2:
It could observed from the above table that for same number of GRID points the performance of the program is getting strictly better with the increasing number of processors. This might be due the fact that we are dividing the task into subproblems on different node to do the parallel computation.

Inference 3:
It could also be observed that for the same number of nodes as the number of grid point increases the time taken to perform the computation also increases. This might be due to the fact that computations are also increasing on each node.

Visual Inference from plot:
It could be observed from attached plots for different number of grid values that as the number of grid points are increasing the curve gets more smother than the curve acheived using lower number of grid points.

---------------------------------End Of Document--------------------------------------

