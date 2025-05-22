#!/bin/bash

echo "🔍 Iniciando benchmark de rendimiento entre Docker y Codespaces..."

# Crear carpeta de resultados si no existe
mkdir -p ../results

# Ejecutar benchmark
python3 ../scripts/benchmark_runner.py

echo "✅ Benchmark finalizado. Revisa los resultados en 'results/'"
