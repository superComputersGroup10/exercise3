#!/bin/bash 
#@ wall_clock_limit = 00:05:00
#@ job_name = pos-cannon-mpi-ibm
#@ job_type = Parallel
#@ output = cannon_64_$(jobid).out
#@ error = cannon_64_$(jobid).out
#@ class = test
#@ node = 1
#@ total_tasks = 4
#@ node_usage = not_shared
#@ energy_policy_tag = cannon
#@ minimize_time_to_solution = yes
#@ notification = never
#@ island_count = 1
#@ queue

. /etc/profile
. /etc/profile.d/modules.sh

echo -e '\n'

date
echo -e "test on A(3x3 and B(3x3)" >> result.csv 
mpiexec -n 9 ./cannon 3x3-1.dat 3x3-2.dat >> result.csv
echo -e '\n' >> result.csv 


date
echo -e "test on A(3x3) and B(3x6)" >> result.csv 
mpiexec -n 9 ./cannon 3x3-1.dat 3x6.dat >> result.csv 
echo -e '\n' >> result.csv 

date
echo -e "test on A(3x3) and B(3x6)" >> result.csv 
mpiexec -n 9 ./cannon 3x3-2.dat 3x6.dat >> result.csv
echo -e '\n' >> result.csv
