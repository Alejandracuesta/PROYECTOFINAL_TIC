import psutil
import time
import subprocess
import threading

def measure_metrics(command, duration=10):
    metrics = {
        "cpu": 0.0,
        "memory": 0.0,
        "disk_write": 0.0,
        "network": 0.0
    }

    disk_before = psutil.disk_io_counters().write_bytes
    net_before = psutil.net_io_counters().bytes_sent + psutil.net_io_counters().bytes_recv

    process = subprocess.Popen(command, stdout=subprocess.PIPE, stderr=subprocess.PIPE)

    cpu_samples = []
    mem_samples = []

    def sample_metrics():
        while process.poll() is None:
            cpu_samples.append(psutil.cpu_percent(interval=0.5))
            mem_samples.append(psutil.virtual_memory().used / (1024 ** 2))  # MB

    monitor_thread = threading.Thread(target=sample_metrics)
    monitor_thread.start()

    # Wait until process finishes
    process.wait()
    monitor_thread.join()

    disk_after = psutil.disk_io_counters().write_bytes
    net_after = psutil.net_io_counters().bytes_sent + psutil.net_io_counters().bytes_recv

    # Agregar métricas finales
    metrics["cpu"] = sum(cpu_samples) / len(cpu_samples) if cpu_samples else 0
    metrics["memory"] = sum(mem_samples) / len(mem_samples) if mem_samples else 0
    metrics["disk_write"] = (disk_after - disk_before) / (1024 ** 2)  # MB
    metrics["network"] = (net_after - net_before) / (1024 ** 2)  # MB

    return metrics