#!/bin/bash 

rm avg_results_test.csv

i=1
base_size=64

for j in {0..6}
do
	current_size=$((2**(6+j)))
	matrix=$current_size'x'$current_size
	echo -e "On matrix of size " $matrix '\n'
	echo -e "FOR MATRICES " $matrix >> avg_results_test.csv
	cat result_$matrix.csv | awk -F'Computation time: ' '{sum1+=$2; } END { print "Avg Computation time: = " sum1/5 }' >> avg_results_test.csv
	cat result_$matrix.csv | awk -F'MPI time:         ' '{sum2+=$2; } END { print "Avg MPI Time: = " sum2/5 }' >> avg_results_test.csv
echo -e '\n' >> avg_results_test.csv
done

#echo -e "FOR MATRICES 64x64" >> avg_results_test.csv
#cat result_64x64.csv | awk -F'Computation time: ' '{sum1+=$2; } END { print "Avg Computation time: = " sum1/5 }' >> avg_results_test.csv
#cat result_64x64.csv | awk -F'MPI time:         ' '{sum2+=$2; } END { print "Avg MPI Time: = " sum2/5 }' >> avg_results_test.csv
#echo -e '\n' >> avg_results_test.csv
#
#echo -e "FOR MATRICES 128x128" >> avg_results_test.csv
#cat result_128x128.csv | awk -F'Computation time:         ' '{sum3+=$2; } END { print "Avg Computation time: = " sum3/5 }' >> avg_results_test.csv
#cat result_128x128.csv | awk -F'MPI time:         ' '{sum4+=$2; } END { print "Avg MPI Time: = " sum4/5 }' >> avg_results_test.csv
#echo -e '\n' >> avg_results_test.csv
#
#
#echo -e "FOR MATRICES 256x256" >> avg_results_test.csv
#cat result_256x256.csv | awk -F'Computation time: ' '{sum5+=$2; } END { print "Avg Computation time: = "sum5/5 }' >> avg_results_test.csv
#cat result_256x256.csv | awk -F'MPI time:         ' '{sum6+=$2; } END { print "Avg MPI Time: = "sum6/5 }' >> avg_results_test.csv
#echo -e '\n' >> avg_results_test.csv
#
#
#echo -e "FOR MATRICES 512x512" >> avg_results_test.csv
#cat result_512x512.csv | awk -F'Computation time: ' '{sum7+=$2; } END { print "Avg Computation time: = "sum7/5 }' >> avg_results_test.csv
#cat result_512x512.csv | awk -F'MPI time:         ' '{sum8+=$2; } END { print "Avg MPI Time: = " sum8/5 }' >> avg_results_test.csv
#
#
#echo -e "FOR MATRICES 1024x1024" >> avg_results_test.csv
#cat result_1024x1024.csv | awk -F'Computation time: ' '{sum9+=$2; } END { print "Avg Computation time: = "sum9/5 }' >> avg_results_test.csv
#cat result_1024x1024.csv | awk -F'MPI time:         ' '{sum10+=$2; } END { print "Avg MPI Time: = "sum10/5 }' >> avg_results_test.csv
#echo -e '\n' >> avg_results_test.csv
#
#
#echo -e "FOR MATRICES 2048x2048" >> avg_results_test.csv
#cat result_2048x2048.csv | awk -F'Computation time: ' '{sum11+=$2; } END { print "Avg Computation time: = "sum11/5 }' >> avg_results_test.csv
#cat result_2048x2048.csv | awk -F'MPI time:         ' '{sum12+=$2; } END { print "Avg MPI Time: = "sum12/5 }' >> avg_results_test.csv
#echo -e '\n' >> avg_results_test.csv
#
#
#echo -e "FOR MATRICES 4096x4096" >> avg_results_test.csv
#cat result_4096x4096.csv | awk -F'Computation time: ' '{sum13+=$2; } END { print "Avg Computation time: = "sum13/5 }' >> avg_results_test.csv
#cat result_4096x4096.csv | awk -F'MPI time:         ' '{sum14+=$2; } END { print "Avg MPI Time: = "sum14/5 }' >> avg_results_test.csv

