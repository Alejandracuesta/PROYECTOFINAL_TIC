#!/bin/bash
# Script para construir y correr el contenedor Docker

echo "Construyendo la imagen Docker..."
docker build -t pacman-game -f scripts/Dockerfile .

echo "Ejecutando el contenedor..."
docker run --rm pacman-game
