#!/bin/bash 

rm avg_results.csv

declare -a array_compute_time=()
declare -a array_mpi_time=()
declare -a array_variance=()
declare -a array_standard_deviation=()
for i in {1..2}
do 
    for j in {0..6}
    do

	    current_size=$((2**(6+j)))
	    matrix=$current_size'x'$current_size

        READ_FILE="Phase$i/result_$matrix.csv"
        WRITE_FILE="Phase$i/avg_results.csv"
       # echo -e $READ_FILE
       # echo -e $WRITE_FILE

	    echo -e "FOR MATRICES " $matrix >> $WRITE_FILE 
	    cat $READ_FILE | awk -F'Computation time: ' '{sum1+=$2; } END { print "Avg Computation time: = " sum1/6 }' >> $WRITE_FILE 
	   # cat $READ_FILE | awk -F'Computation time: ' '{$array_compute_time[$i++]=$2; } END' 

	    cat $READ_FILE | awk -F'MPI time: ' '{sum2+=$2; } END { print "Avg MPI Time: = " sum2/6 }' >> $WRITE_FILE 
    echo -e '\n' >> $WRITE_FILE
    done
done 
