#!/bin/bash
# Script para compilar y ejecutar PacManGame en una VM local

echo "Compilando PacManGame.java..."
javac pacman/src/PacManGame.java

echo "Ejecutando PacManGame..."
java -cp pacman/src PacManGame
