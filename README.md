# 🧪 VM vs Docker Benchmark con PacMan 🎮

Este proyecto compara el rendimiento de un entorno Docker frente a un entorno de máquina virtual (VM, como GitHub Codespaces) utilizando un pequeño juego en Java: **PacMan**.

Se evalúan múltiples métricas de sistema mientras el juego se ejecuta en ambos entornos.

---

## 🧠 ¿Qué se compara?

| Métrica              | Descripción                                                                 |
|----------------------|-----------------------------------------------------------------------------|
| ⏱ Tiempo de arranque | Tiempo total desde el inicio hasta la finalización del script.              |
| 🧠 Uso de CPU         | Promedio de uso de CPU durante la ejecución.                                |
| 💾 Memoria            | Memoria RAM media utilizada (en MB).                                        |
| 📝 Escritura en disco | Total de datos escritos en disco (en MB).                                   |
| 🌐 Uso de red         | Total de datos transmitidos y recibidos por red (en MB).                    |

---

## 📦 Estructura del Proyecto

```text
vm_vs_docker_benchmark/
├── pacman/
│ └── src/
│ └── PacManGame.java 
├── scripts/
│ ├── Dockerfile
│ ├── docker_setup.sh 
│ ├── vm_setup.sh 
│ ├── run_benchmark.sh 
│ ├── benchmark_runner.py
│ └── monitor_metrics.py 
├── results/
│ ├── metrics.txt 
│ ├── times.txt
│ ├── benchmark_chart.png
│ └── full_benchmark.png
│ 
├── notebooks/
│ ├── install.ipynb
│ ├── vm_vs_docker_comparison.ipybn
│ └── docker_vs_codespaces_results.ipynb 
│
├── README.md
└── .gitignore
README.md
setup_project.sh
```

## 🎯 Objetivos del Proyecto

- Comparar el rendimiento de ejecución del mismo juego (PacMan en Java) en dos entornos distintos:
  - 🐳 Docker (contenedor ligero)
  - 💻 VM (GitHub Codespaces u otra máquina virtual)

- Evaluar las siguientes métricas de sistema en ambos entornos:
  - ⏱ Tiempo de arranque
  - 🧠 Uso promedio de CPU
  - 💾 Uso promedio de memoria RAM
  - 📝 Escritura en disco
  - 🌐 Tráfico de red

- Automatizar la recolección de métricas y su visualización gráfica.

- Ayudar a tomar decisiones informadas sobre qué entorno es más eficiente en función del uso.

## 📊 Resultados

Después de ejecutar el benchmark, se generan dos archivos principales:

- `results/metrics.txt`: contiene las métricas numéricas extraídas para Docker y VM.
- `results/full_benchmark.png`: gráfico visual que compara las métricas entre los dos entornos.

### 📄 Ejemplo de `metrics.txt`

VM_boot_time=2.34
VM_cpu=45.23
VM_memory=305.12
VM_disk_write=5.10
VM_network=0.23

Docker_boot_time=1.87
Docker_cpu=35.70
Docker_memory=289.76
Docker_disk_write=4.80
Docker_network=0.20


### 📈 Gráfico generado

- El archivo `full_benchmark.png` muestra una comparación en barras entre:
  - Tiempo de arranque
  - Uso de CPU
  - Memoria RAM
  - Escritura en disco
  - Tráfico de red

Este gráfico se genera automáticamente al final del benchmark.

