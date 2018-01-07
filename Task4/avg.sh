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
    awk -F'Computation time: ' '{sum1+=$2; } END { print "Avg Computation time: = " sum1/6 }' $READ_FILE >> $WRITE_FILE 
    mapfile -t array_compute_time < <( awk -F'Computation time: ' '{print $2 }' "$READ_FILE" ) 
    awk -F'MPI time: ' '{sum2+=$2; } END { print "Avg MPI Time: = " sum2/6 }' $READ_FILE >> $WRITE_FILE 
    echo -e '\n' >> $WRITE_FILE
    
   # compute_time_sum=0
    for each in ${array_compute_time[@]}
    do
        echo $each
        #let compute_time_sum+=$each 
    done
    #echo -e "current matrix size: $matrix\nTotal Compute time: $compute_time_sum\n"
    
done

done 
