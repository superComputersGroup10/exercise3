#!/usr/bin/python3

import argparse
import re
import csv
import math


def get_data(filename):
    """Returns a list with computing and mpi time
    :filename: File with output results
    :returns: list with computing and mpi time
    """
    with open(filename, 'r') as f:
        text = f.read()
    r_computation_times = re.findall(r'Computation time:\s+(\d+\.\d+)', text)
    r_mpi_times = re.findall(r'MPI time:\s+(\d+\.\d+)', text)
    r_total_times = re.findall(r'Total time:\s+(\d+.\d+)', text)
    computation_times = [float(i) for i in r_computation_times]
    mpi_times = [float(i) for i in r_mpi_times]
    total_times = [float(i) for i in r_total_times]
    return computation_times, mpi_times, total_times


def get_mean(data):
    return math.fsum(data) / len(data)


def get_var(data, mean):
    return math.fsum([(mean - val)*(mean - val) for val in data]) / len(data)

def main():
    parser = argparse.ArgumentParser(description="Generates a .csv with the time results")
    parser.add_argument("-f", "--files", nargs = '*', help="List of files with time results")
    parser.add_argument("-o", "--output", help="Output file")
    args = parser.parse_args()

    with open(args.output, "w") as csvfile:
        spamwriter = csv.writer(csvfile, delimiter=',')
        spamwriter.writerow(["Case", "Mean MPI", "Mean Comp", "Mean Total", "Variance MPI", "Variance Comp",
            "Variance Total", "Standard Deviation MPI", "Standard Deviation Comp", "Standard Deviation total"])
        for f in args.files:
            computation_times, mpi_times, total_times = get_data(f)
            mean_computation = get_mean(computation_times)
            mean_mpi = get_mean(mpi_times)
            mean_total = get_mean(total_times)
            var_computation = get_var(computation_times, mean_computation)
            var_mpi = get_var(mpi_times, mean_mpi)
            var_total = get_var(total_times, mean_total)
            sd_computation = math.sqrt(var_computation)
            sd_mpi = math.sqrt(var_mpi)
            sd_total = math.sqrt(var_total)
            spamwriter.writerow([f, mean_mpi, mean_computation, mean_total, var_mpi, var_computation,
                var_total, sd_mpi, sd_computation, sd_total])


if __name__ == "__main__":
    main()
