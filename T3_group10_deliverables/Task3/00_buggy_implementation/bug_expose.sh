#!/bin/bash 

make clean
make
RESULT="bug_results/results.csv"
READ_DIR="bug_exposing_matrices"
rm -r bug_results/*.csv

echo -e " Lets expose some bugs B=) \n" >> $RESULT

date
echo -e "test on A(3x3 and B(3x3)" >> $RESULT
mpirun -np 9 ./cannon $READ_DIR/3x3-1.dat $READ_DIR/3x3-2.dat t >> $RESULT
echo -e '\n\n' >> $RESULT


date
echo -e "test on A(3x3) and B(3x6)" >> $RESULT
mpirun -np 9 ./cannon $READ_DIR/3x3-1.dat $READ_DIR/3x6.dat t >> $RESULT
echo -e '\n\n' >> $RESULT 

date
echo -e "test on A(3x3) and B(3x6)" >> $RESULT 
mpirun -np 9 ./cannon $READ_DIR/3x3-2.dat $READ_DIR/3x6.dat t >> $RESULT
echo -e '\n\n' >> $RESULT

date
echo -e "test on A(2x4) and B(4x2)" >> $RESULT 
mpirun -np 4 ./cannon $READ_DIR/4x2.dat $READ_DIR/2x4.dat t >> $RESULT
echo -e '\n\n' >> $RESULT

date
echo -e "test on A(4x4) and B(4x4)" >> $RESULT
mpirun -np 4 ./cannon $READ_DIR/4x4-1.dat $READ_DIR/4x4-2.dat t >> $RESULT
echo -e '\n\n' >> $RESULT
