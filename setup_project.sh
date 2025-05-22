#!/bin/bash

echo "Creando estructura de carpetas..."
mkdir -p vm_vs_docker_benchmark/pacman/src
mkdir -p vm_vs_docker_benchmark/scripts
mkdir -p vm_vs_docker_benchmark/notebooks
mkdir -p vm_vs_docker_benchmark/results

echo "Creando archivos..."

# PacManGame.java
cat > vm_vs_docker_benchmark/pacman/src/PacManGame.java << 'EOF'
package pacman.src;

public class PacManGame {
    public static void main(String[] args) {
        System.out.println("¡Bienvenido a PacMan!");
        // Aquí puedes agregar la lógica del juego o simplemente simularlo
        System.out.println("Juego iniciado...");
        // Simulación simple
        for (int i = 0; i < 5; i++) {
            System.out.println("PacMan se mueve...");
            try {
                Thread.sleep(1000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
        System.out.println("Juego terminado. ¡Gracias por jugar!");
    }
}
EOF

# Dockerfile
cat > vm_vs_docker_benchmark/scripts/Dockerfile << 'EOF'
# Usamos una imagen base con Java
FROM openjdk:11-jdk-slim

# Directorio de trabajo dentro del contenedor
WORKDIR /app

# Copiamos el código fuente
COPY ../pacman/src/PacManGame.java ./PacManGame.java

# Compilamos el código
RUN javac PacManGame.java

# Comando para ejecutar la aplicación
CMD ["java", "PacManGame"]
EOF

# docker_setup.sh
cat > vm_vs_docker_benchmark/scripts/docker_setup.sh << 'EOF'
#!/bin/bash
# Script para construir y correr el contenedor Docker

echo "Construyendo la imagen Docker..."
docker build -t pacman-game -f scripts/Dockerfile .

echo "Ejecutando el contenedor..."
docker run --rm pacman-game
EOF
chmod +x vm_vs_docker_benchmark/scripts/docker_setup.sh

# vm_setup.sh
cat > vm_vs_docker_benchmark/scripts/vm_setup.sh << 'EOF'
#!/bin/bash
# Script para compilar y ejecutar PacManGame en una VM local

echo "Compilando PacManGame.java..."
javac pacman/src/PacManGame.java

echo "Ejecutando PacManGame..."
java -cp pacman/src PacManGame
EOF
chmod +x vm_vs_docker_benchmark/scripts/vm_setup.sh

# vm_vs_docker_comparison.ipynb (contenido en JSON simplificado)
cat > vm_vs_docker_benchmark/notebooks/vm_vs_docker_comparison.ipynb << 'EOF'
{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": [
    "import time\n",
    "import subprocess\n",
    "\n",
    "def run_vm():\n",
    "    start = time.time()\n",
    "    result = subprocess.run(['bash', 'scripts/vm_setup.sh'], capture_output=True, text=True)\n",
    "    end = time.time()\n",
    "    return end - start, result.stdout\n",
    "\n",
    "def run_docker():\n",
    "    start = time.time()\n",
    "    result = subprocess.run(['bash', 'scripts/docker_setup.sh'], capture_output=True, text=True)\n",
    "    end = time.time()\n",
    "    return end - start, result.stdout\n",
    "\n",
    "vm_time, vm_output = run_vm()\n",
    "docker_time, docker_output = run_docker()\n",
    "\n",
    "print(f\"Tiempo VM: {vm_time:.2f} segundos\")\n",
    "print(f\"Salida VM:\\n{vm_output}\")\n",
    "\n",
    "print(f\"Tiempo Docker: {docker_time:.2f} segundos\")\n",
    "print(f\"Salida Docker:\\n{docker_output}\")"
   ]
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "Python 3",
   "language": "python",
   "name": "python3"
  },
  "language_info": {
   "name": "python",
   "version": "3.10"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
EOF

# README.md
cat > vm_vs_docker_benchmark/README.md << 'EOF'
# VM vs Docker Benchmark - PacMan Game

Este proyecto compara el rendimiento de ejecutar un juego simple de PacMan en una máquina virtual (VM) versus un contenedor Docker.

## Estructura del proyecto

- `pacman/src/PacManGame.java`: Código fuente del juego.
- `scripts/Dockerfile`: Dockerfile para construir la imagen del juego.
- `scripts/docker_setup.sh`: Script para construir y ejecutar el contenedor Docker.
- `scripts/vm_setup.sh`: Script para compilar y ejecutar el juego en la VM local.
- `notebooks/vm_vs_docker_comparison.ipynb`: Notebook para medir y comparar tiempos de ejecución.
- `results/`: Carpeta para guardar resultados y métricas.
- `.gitignore`: Archivos y carpetas ignorados por Git.

## Cómo usar

1. Ejecuta `scripts/vm_setup.sh` para correr el juego en VM.
2. Ejecuta `scripts/docker_setup.sh` para correr el juego en Docker.
3. Usa el notebook `notebooks/vm_vs_docker_comparison.ipynb` para comparar tiempos y analizar resultados.

---

¡Diviértete benchmarking!
EOF

# .gitignore
cat > vm_vs_docker_benchmark/.gitignore << 'EOF'
# Ignorar archivos compilados de Java
*.class

# Ignorar resultados
results/

# Ignorar archivos temporales y cachés
*.log
*.tmp
__pycache__/
.ipynb_checkpoints/
EOF

echo "¡Proyecto creado con éxito en la carpeta 'vm_vs_docker_benchmark'!"