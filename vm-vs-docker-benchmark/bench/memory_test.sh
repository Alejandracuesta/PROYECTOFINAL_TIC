#!/bin/bash
echo "Running Memory benchmark"
sysbench memory --memory-total-size=1G run
