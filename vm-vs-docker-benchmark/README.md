# Comparativa de Rendimiento: GitHub Codespaces vs Docker Local  
## Aplicación Java – Juego Pac-Man 🎮

**Autor**: Alejandra Cuesta Rodríguez
**Fecha**: 24/05/2025  
**Proyecto de Evaluación de TIC**  

---

## 1. Introducción

Este proyecto tiene como objetivo comparar el rendimiento de dos entornos de desarrollo y ejecución distintos:  
- **GitHub Codespaces**, una solución basada en la nube.  
- **Docker local**, ejecutado en una máquina física.  

Para ello se ha implementado una aplicación gráfica en Java: un juego sencillo de **Pac-Man** con Swing.  
Se han ejecutado métricas de rendimiento durante la ejecución del juego para observar diferencias clave en tiempo de arranque, consumo de CPU, uso de memoria, acceso a disco y respuesta visual.

---

## 2. Preparación del entorno

Se han utilizado los siguientes entornos base:

- **Docker local**: Ubuntu 22.04, Java 17, entorno gráfico virtualizado por X11, ejecutado en un portátil con 8 GB de RAM y 4 núcleos.
- **GitHub Codespaces**: entorno cloud sobre contenedores, con 2 núcleos virtuales y entorno basado en Debian/Ubuntu.

Ambos entornos fueron configurados con:
- Java OpenJDK 17
- Swing (JDK estándar)
- Sysbench, `psutil`, `jupyter`, `matplotlib` para análisis complementario

---

## 3. Métricas analizadas

### 3.1 Tiempo de arranque del juego
Tiempo desde la ejecución del comando hasta que aparece la ventana del juego.

### 3.2 Uso de CPU
Porcentaje medio de uso durante el juego.

### 3.3 Memoria RAM utilizada
Memoria consumida por el proceso Java + GUI.

### 3.4 Escritura en disco
Tiempo para generar y escribir archivos temporales del juego (log, configuración, etc.)

### 3.5 Fluidez visual
Evaluación subjetiva de velocidad de refresco (FPS estimado a ojo).

---

## 4. Resultados comparativos

| Métrica                  | Docker Local 🐳       | Codespaces 🌐        |
|--------------------------|-----------------------|-----------------------|
| Tiempo de arranque       | ~1.3 s (rápido)       | ~7–9 s (lento)        |
| Uso medio de CPU         | 8–12%                 | 18–22%                |
| Memoria RAM utilizada    | 140 MB                | 190 MB                |
| Escritura en disco (log) | 0.4 s                 | 1.1 s                 |
| Fluidez visual (FPS)     | Fluido (60 FPS)       | Ligeramente lento (~40 FPS) |

---

## 5. Análisis comparativo

El juego **Pac-Man en Java** requiere poca CPU y RAM, pero su entorno de ejecución gráfico penaliza a Codespaces, ya que no tiene acceso directo a la GPU ni entorno gráfico nativo.

- **Docker local** se beneficia de un entorno físico y acceso más directo al sistema gráfico y recursos de hardware.
- **Codespaces** añade una capa intermedia de red y virtualización que introduce retardo, especialmente en tareas gráficas o en tiempo real.

---

## 6. Conclusión

**¿Cuándo usar Docker local?**  
✅ Cuando se desea rendimiento óptimo  
✅ Para pruebas gráficas o juegos  
✅ Si se tiene acceso local al hardware

**¿Cuándo usar Codespaces?**  
✅ Para desarrollo rápido y colaborativo  
✅ Cuando no se puede instalar software localmente  
✅ Ideal para edición de código, no ejecución gráfica intensiva

---

## 7. Ejecución

```bash
# Docker local:
docker build -t pacman-benchmark .
docker run --rm -it pacman-benchmark

# Codespaces:
# Abrir la terminal, compilar y ejecutar manualmente
cd pacman/src
javac pacman/PacManGame.java
java pacman.PacManGame
