#!/bin/bash 

rm avg_results.csv

for i in {1..2}
do 
	SUPERMUC_PHASE="Phase$j"
for j in {0..6}
do
	current_size=$((2**(6+j)))
	matrix=$current_size'x'$current_size
	READ_FILE="$SUPERMUC_PHASE/result_$matrix.csv"
	WRITE_FILE="$SUPERMUC_PHASE/avg_results.csv"
	echo -e "FOR MATRICES " $matrix >> avg_results.csv
	cat $READ_FILE | awk -F'Computation time: ' '{sum1+=$2; } END { print "Avg Computation time: = " sum1/20 }' >> $WRITE_FILE
	cat $READ_FILE | awk -F'MPI time:         ' '{sum2+=$2; } END { print "Avg MPI Time: = " sum2/20 }' >> $WRITE_FILE
echo -e '\n' >> $WRITE_FILE
done
