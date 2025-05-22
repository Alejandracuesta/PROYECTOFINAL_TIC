# Evaluación Comparativa de Rendimiento: Máquina Virtual vs Docker

## 1. Introducción

Las máquinas virtuales (VM) y los contenedores (como Docker) son tecnologías clave para la virtualización y despliegue moderno de aplicaciones. Una máquina virtual permite emular un sistema operativo completo utilizando un hipervisor, mientras que un contenedor Docker encapsula una aplicación y sus dependencias, ejecutándose directamente sobre el kernel del sistema operativo del host. Esta diferencia arquitectónica tiene un gran impacto en el rendimiento, portabilidad, seguridad y consumo de recursos.

## 2. Preparación del entorno

Se configuraron dos entornos con una base común:

- **Docker en local**: máquina física con Ubuntu 22.04 y 4 núcleos de CPU.
- **GitHub Codespaces**: entorno virtualizado en la nube con contenedores gestionados.

En ambos se usaron imágenes base de Ubuntu 22.04 y se instalaron las siguientes herramientas:

- `sysbench` para CPU y memoria
- `dd` para acceso a disco
- `iperf3` para red
- `ab` para carga web simulada en una app Node.js

## 3. Métricas analizadas

Se realizaron las siguientes pruebas:

- **CPU y memoria**: con `sysbench`
- **Acceso a disco**: con `dd`
- **Rendimiento de red**: con `iperf3`
- **Tiempo de arranque**: ejecución de contenedores
- **Carga real**: aplicación Node.js sometida a 1000 peticiones concurrentes con `ab`

## 4. Resultados comparativos

| Métrica                | Docker Local        | Codespaces              |
|------------------------|---------------------|--------------------------|
| Tiempo de arranque     | ~1.2 segundos       | ~10–15 segundos         |
| CPU (`sysbench`)       | ~650 ev/seg         | ~480–520 ev/seg         |
| Uso de memoria         | Estable (~500MB)    | Variable                |
| Escritura en disco     | 1.8–2.2 segundos    | 3.5–6 segundos           |
| Red (`iperf3`)         | ~940 Mbps           | 100–300 Mbps (60–100 ms)|
| Node.js + `ab`         | ~950 req/s          | ~700 req/s              |

### 📊 Gráfico Comparativo

A continuación se muestra un gráfico generado automáticamente que resume los resultados de forma visual:

![Comparativa de Rendimiento](comparativa_rendimiento.png)

Este gráfico fue creado con `matplotlib` desde el script `análisis_comparativo.py`, usando datos reales de las pruebas realizadas.

## 5. Análisis comparativo

Docker ejecutado localmente muestra mayor rendimiento al estar más cerca del hardware. Codespaces, aunque más limitado, es ideal para colaboración, CI/CD y entornos inmediatos.

**Resumen:**

- **Docker Local**: más rápido, estable, ideal para pruebas exigentes y desarrollo offline.
- **Codespaces**: flexible, escalable y perfecto para colaboración y portabilidad.

## 6. Conclusión

### Usa Docker Local si:
- Buscas el mejor rendimiento
- Trabajas sin conexión
- Necesitas baja latencia

### Usa GitHub Codespaces si:
- Necesitas entornos portables
- Trabajas en equipo remoto
- Prioriza la facilidad de uso

## 🛠 Cómo ejecutar este proyecto

1. Clona el repositorio:

```bash
git clone https://github.com/tuusuario/vm-vs-docker-benchmark.git
cd vm-vs-docker-benchmark


---

## 🛠 Cómo ejecutar este proyecto

Clona el repositorio:

```bash
git clone https://github.com/tuusuario/vm-vs-docker-benchmark.git
cd vm-vs-docker-benchmark
