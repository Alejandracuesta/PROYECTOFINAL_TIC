#!/bin/bash
echo "Running CPU benchmark with sysbench"
sysbench cpu --threads=4 --time=30 run
