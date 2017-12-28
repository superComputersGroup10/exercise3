#!/bin/bash 

rm avg_results.csv

echo -e "FOR MATRICES 64x64" >> avg_results.csv
cat result_64x64.csv | awk -F'Computation time: ' '{sum1+=$2; } END { print "Avg Computation time: = "sum1/5 }' >> avg_results.csv
cat result_64x64.csv | awk -F'MPI time:         ' '{sum2+=$2; } END { print "Avg MPI Time: = "sum2/5 }' >> avg_results.csv
echo -e '\n' >> avg_results.csv

echo -e "FOR MATRICES 128x128" >> avg_results.csv
cat result_128x128.csv | awk -F'Computation time: ' '{sum3+=$2; } END { print "Avg Computation time:  = "su3/5 }' >> avg_results.csv
cat result_128x128.csv | awk -F'MPI time:         ' '{sum4+=$2; } END { print "Avg MPI Time: "sum2"/"5 "="sum4/5 }' >> avg_results.csv
echo -e '\n' >> avg_results.csv


echo -e "FOR MATRICES 256x256" >> avg_results.csv
cat result_256x256.csv | awk -F'Computation time: ' '{sum5+=$2; } END { print "Avg Computation time: = "sum5/5 }' >> avg_results.csv
cat result_256x256.csv | awk -F'MPI time:         ' '{sum6+=$2; } END { print "Avg MPI Time: = "sum6/5 }' >> avg_results.csv
echo -e '\n' >> avg_results.csv


echo -e "FOR MATRICES 512x512" >> avg_results.csv
cat result_512x512.csv | awk -F'Computation time: ' '{sum7+=$2; } END { print "Avg Computation time: = "sum7/5 }' >> avg_results.csv
cat result_512x512.csv | awk -F'MPI time:         ' '{sum8+=$2; } END { print "Avg MPI Time: "sum2"/"5 "="sum8/5 }' >> avg_results.csv
echo -e '\n' >> avg_results.csv


echo -e "FOR MATRICES 1024x1024" >> avg_results.csv
cat result_1024x1024.csv | awk -F'Computation time: ' '{sum9+=$2; } END { print "Avg Computation time: = "sum9/5 }' >> avg_results.csv
cat result_1024x1024.csv | awk -F'MPI time:         ' '{sum10+=$2; } END { print "Avg MPI Time: = "sum10/5 }' >> avg_results.csv
echo -e '\n' >> avg_results.csv


echo -e "FOR MATRICES 2048x2048" >> avg_results.csv
cat result_2048x2048.csv | awk -F'Computation time: ' '{sum11+=$2; } END { print "Avg Computation time: = "sum11/5 }' >> avg_results.csv
cat result_2048x2048.csv | awk -F'MPI time:         ' '{sum12+=$2; } END { print "Avg MPI Time: = "sum12/5 }' >> avg_results.csv
echo -e '\n' >> avg_results.csv


echo -e "FOR MATRICES 4096x4096" >> avg_results.csv
cat result_4096x4096.csv | awk -F'Computation time: ' '{sum13+=$2; } END { print "Avg Computation time: = "sum13/5 }' >> avg_results.csv
cat result_4096x4096.csv | awk -F'MPI time:         ' '{sum14+=$2; } END { print "Avg MPI Time: = "sum14/5 }' >> avg_results.csv
                                                                                                                                    1,12          T
