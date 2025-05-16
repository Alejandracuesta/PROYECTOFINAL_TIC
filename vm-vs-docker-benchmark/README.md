# Evaluación comparativa de rendimiento: Máquina Virtual vs Docker

## 1. Introducción

Las máquinas virtuales (VM) y los contenedores (como Docker) son tecnologías clave para la virtualización y despliegue moderno de aplicaciones. Una máquina virtual permite emular un sistema operativo completo utilizando un hipervisor, mientras que un contenedor Docker encapsula una aplicación y sus dependencias, ejecutándose directamente sobre el kernel del sistema operativo del host. Esta diferencia arquitectónica tiene un gran impacto en el rendimiento, portabilidad, seguridad y consumo de recursos.

## 2. Configuración del entorno

La evaluación se realizó comparando:

- Docker local sobre un sistema Ubuntu 22.04 físico con 4 núcleos de CPU.
- GitHub Codespaces, que ofrece entornos virtualizados bajo demanda con contenedores preconfigurados sobre infraestructura en la nube.

Se utilizaron imágenes base de Ubuntu 22.04 para ambos entornos (Docker y Codespaces), instalando las mismas herramientas de prueba.

## 3. Métricas evaluadas

Durante las pruebas usé:

- CPU y memoria mediante pruebas sintéticas con `sysbench`.
- Velocidad de acceso a disco utilizando `dd`.
- Rendimiento de red con `iperf3`.
- Tiempos de arranque de ambos.
- Desempeño de una aplicación Node.js bajo carga simulada con `ab` (Apache Benchmark).

## 4. Resultados y diferencias entre Docker local y Codespaces

### 🔄 Tiempo de arranque

En pruebas automatizadas, iniciar un contenedor localmente con Docker (`docker run`) tomó en promedio **1.2 segundos**. En Codespaces, desde la solicitud de entorno hasta el inicio del contenedor, el tiempo fue aproximadamente **10–15 segundos**, debido a la preparación del entorno remoto y sincronización del repositorio.

### ⚙️ CPU y rendimiento general

Ejecutando `sysbench cpu --threads=4 --time=30`:

- En Docker local, se alcanzaron alrededor de **650 eventos por segundo**, aprovechando el hardware del host sin virtualización adicional.
- En Codespaces, el mismo benchmark alcanzó solo **480–520 eventos por segundo**, probablemente por las restricciones del entorno compartido y la virtualización adicional de la infraestructura cloud.

### 🧠 Uso de memoria

La memoria usada por Docker local al ejecutar las pruebas fue más estable (~500MB adicionales), mientras que en Codespaces, dependiendo de la carga y otras tareas del contenedor, se observó mayor variabilidad y menor predictibilidad.

### 📀 E/S de disco

La prueba `dd if=/dev/zero of=testfile bs=1G count=1 oflag=dsync`:

- En Docker local, tardó entre **1.8 y 2.2 segundos** en completarse.
- En Codespaces, los tiempos variaron entre **3.5 y 6.0 segundos**, indicando un sistema de archivos virtualizado más lento.

### 🌐 Red

La prueba con `iperf3` (desde y hacia el contenedor):

- Docker local: velocidad promedio de **940 Mbps** en LAN.
- Codespaces: limitado por la infraestructura de GitHub, velocidades observadas de **100–300 Mbps** con mayor latencia (incluso 60–100 ms).

### ⚡ Aplicación real: Node.js + Apache Benchmark

Con una pequeña aplicación Node.js expuesta en el puerto 3000 y ejecutando `ab -n 1000 -c 10`:

- Docker local: manejó **~950 req/s** con una latencia promedio de **15–20 ms**.
- Codespaces: logró **~700 req/s** y la latencia fue más alta (**~35–50 ms**).

## 5. Análisis comparativo

La ejecución local en Docker ofrece una experiencia mucho más cercana al hardware, con mayor rendimiento y menor latencia en todas las métricas técnicas. GitHub Codespaces es extremadamente conveniente para desarrollo colaborativo, portabilidad y CI/CD, pero tiene limitaciones de rendimiento natural debido a su entorno virtualizado y compartido en la nube.

En resumen:

- **Docker local** destaca por velocidad y eficiencia.
- **Codespaces** brilla por flexibilidad, escalabilidad inmediata y configuración cero.

## 6. Conclusión: ¿Cuándo usar cada uno?

- Elige **Docker local** si necesitas exprimir el máximo rendimiento para pruebas exigentes, desarrollo offline o si tu aplicación es sensible al tiempo de respuesta.
- Usa **GitHub Codespaces** cuando priorices colaboración, portabilidad, entornos consistentes y despliegue inmediato desde cualquier lugar.

---

## 🛠 Cómo ejecutar este proyecto

Clona el repositorio:

```bash
git clone https://github.com/tuusuario/vm-vs-docker-benchmark.git
cd vm-vs-docker-benchmark
