import os

def parse_sysbench_cpu(file_path):
    with open(file_path) as f:
        for line in f:
            if "events per second" in line:
                print("CPU Performance:", line.strip())

# Agrega funciones similares para disk, memory, etc.

if __name__ == "__main__":
    parse_sysbench_cpu("results/cpu_docker.txt")
