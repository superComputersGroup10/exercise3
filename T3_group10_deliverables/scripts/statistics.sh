#!/bin/bash

FILES="result_64x64.csv result_128x128.csv result_256x256.csv result_512x512.csv result_1024x1024.csv"
FILES+=" result_2048x2048.csv result_4096x4096.csv"

TASK="Task5"
PHASE="Phase1"
PYTHON_SCRIPT="parser.py"

TARGET_DIRECTORY=../$TASK/$PHASE # Directory with results. Change accordingly (by default task/phase)
INIT_DIRECTORY="$(pwd)"
OUTPUT=$TASK"_"$PHASE".csv"

cp $PYTHON_SCRIPT $TARGET_DIRECTORY
cd $TARGET_DIRECTORY

python $PYTHON_SCRIPT -f $FILES -o $OUTPUT
mv $OUTPUT $INIT_DIRECTORY

rm $PYTHON_SCRIPT
cd $INIT_DIRECTORY
