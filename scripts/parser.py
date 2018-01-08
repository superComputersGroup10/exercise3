#!/usr/bin/python3

import argparse
import re
import csv


def get_data(filename):
    """Returns a list with computing and mpi time
    :filename: File with output results
    :returns: list with computing and mpi time
    """
    with open(filename, 'r') as f:
        text = f.read()
    computation_times = re.findall(r'Computation time:\s+(\d+\.\d+)', text)
    print(computation_times)


def main():
    parser = argparse.ArgumentParser(description="Generates a .csv with the time results")
    parser.add_argument("-f", "--files", nargs = '*', help="List of files with time results")
    parser.add_argument("-b", "--baseline", help="File with baseline data used for speedup calculation")
    parser.add_argument("-o", "--output", help="Output file")
    args = parser.parse_args()

    for f in args.files:
        get_data(f)

if __name__ == "__main__":
    main()
