#!/bin/bash
echo "Running Disk IO benchmark"
dd if=/dev/zero of=disk_test bs=1G count=1 oflag=dsync
rm disk_test
