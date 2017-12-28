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

date
echo -e "test on A(2x4) and B(4x2)" >> result.csv 
mpiexec -n 4 ./cannon 2x4-1.dat 4x2.dat >> tee -a result.csv
echo -e '\n' >> result.csv 


date
echo -e "test on A(4x4) and B(4x4)" >> result.csv 
mpiexec -n 4 ./cannon 4x4-1.dat 4x4-2.dat >> result.csv 
echo -e '\n' >> result.csv 

date
echo -e "test on A(2x4) and B(4x4)" >> result.csv 
mpiexec -n 4 ./cannon 2x4.dat 4x4-1.dat >> result.csv
echo -e '\n' >> result.csv
