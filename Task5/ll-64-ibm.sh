#!/bin/bash 
#@ wall_clock_limit = 00:05:00
#@ job_name = pos-cannon-mpi-ibm
#@ job_type = Parallel
#@ output = cannon_64_$(jobid).out
#@ error = cannon_64_$(jobid).out
#@ class = test
#@ node = 4
#@ total_tasks = 64
#@ node_usage = not_shared
#@ energy_policy_tag = cannon
#@ minimize_time_to_solution = yes
#@ notification = never
#@ island_count = 1
#@ queue

. /etc/profile
. /etc/profile.d/modules.sh

date
for i in {0..5}
do
echo -e "test " $i " on A(64x64) and B(64x64)" >> result_64x64.csv
mpiexec -n 64 ./cannon 64x64-1.in 64x64-2.in | tee -a result_64x64.csv
echo -e '\n' >> result_64x64.csv
done


date
for i in {0..5}
do
echo -e "test " $i " on A(128x128) and B(128x128)" >> result_128x128.csv
mpiexec -n 64 ./cannon 128x128-1.in 128x128-2.in >> result_128x128.csv
echo -e '\n' >> result_128x128.csv
done

date
for i in {0..5}
do
echo -e "test " $i " on A(256x256) and B(256x256)" >> result_256x256.csv
mpiexec -n 64 ./cannon 256x256-1.in 256x256-2.in >> result_256x256.csv
echo -e '\n' >> result_256x256.csv
done


date
for i in {0..5}
do
echo -e "test " $i " on A(512x512) and B(512x512)" >> result_512x512.csv
mpiexec -n 64 ./cannon 512x512-1.in 512x512-2.in >> result_512x512.csv
echo -e '\n' >> result_512x512.csv
done


date
for i in {0..5}
do
echo -e "test " $i " on A(1024x1024) and B(1024x1024)" >> result_1024x1024.csv
mpiexec -n 64 ./cannon 1024x1024-1.in 1024x1024-2.in >> result_1024x1024.csv
echo -e '\n' >> result_1024x1024.csv
done


date
for i in {0..5}
do
echo -e "test " $i " on A(2048x2048) and B(2048x2048)" >> result_2048x2048.csv
mpiexec -n 64 ./cannon 2048x2048-1.in 2048x2048-2.in >> result_2048x2048.csv
echo -e '\n' >> result_2048x2048.csv
done


date
for i in {0..5}
do
echo -e "test " $i " on A(4096x4096) and B(4096x4096)" >> result_4096x4096.csv
mpiexec -n 64 ./cannon 4096x4096-1.in 4096x4096-2.in >> result_4096x4096.csv
echo -e '\n' >> result_4096x4096.csv
done

