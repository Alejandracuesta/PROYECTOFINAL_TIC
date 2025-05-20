# Evaluación Comparativa de Rendimiento: Máquina Virtual vs Docker

## 1. Introducción

Las máquinas virtuales operan con un programa raro, una capa que permite usar muchos sistemas en el mismo aparato. Esto sugiere que cada máquina virtual trae su propio programa base, lo que causa mayor uso de los recursos. Por otro lado, las cajas, como usa Docker, no necesitan un sistema entero para cada cosa. Más bien, comparten el mismo centro del sistema base, lo que las hace más ligeras y veloces.

Estas diferencias técnicas tienen un impacto directo en aspectos clave del rendimiento: uso de CPU, memoria, acceso a disco, red y tiempo de arranque. El objetivo de este documento es comparar ambos enfoques a través de pruebas concretas, con datos objetivos que ayuden a decidir cuál conviene más en cada situación.

## 2. Preparación del entorno

Para realizar esta comparativa, se configuraron dos entornos con una base común, pero que se diferencian en su arquitectura y lugar de ejecución.

- **Docker en local**: Se ejecutó sobre una máquina física con Ubuntu 22.04, equipada con 4 núcleos de CPU y recursos suficientes para realizar pruebas con fluidez. Este entorno representa una configuración de desarrollo habitual en equipos personales.

- **GitHub Codespaces**: Se trata de un entorno gestionado en la nube que permite lanzar contenedores directamente desde el navegador, sin necesidad de instalar nada en el ordenador. Utiliza la infraestructura en la nube de GitHub y Microsoft para ofrecer entornos listos para trabajar desde cualquier sitio.

En ambos casos se utilizaron imágenes base de Ubuntu 22.04, y se instalaron manualmente las herramientas necesarias para las pruebas de rendimiento:

- `sysbench` para medir CPU y memoria.
- `dd` para pruebas de escritura en disco.
- `iperf3` para comprobar el rendimiento de red.
- `ab` (Apache Benchmark) para simular carga sobre una aplicación en Node.js.

Esta preparación garantiza que cualquier diferencia en los resultados se deba exclusivamente al tipo de entorno (local o en la nube), y no a las herramientas o sistemas utilizados.

## 3. Métricas analizadas

Para ofrecer una visión completa del rendimiento, se definieron cinco tipos de pruebas:

- **Prueba de CPU**: Se ejecutó un test con `sysbench` utilizando 4 hilos durante 30 segundos. Esta prueba realiza cálculos intensivos para medir la capacidad del procesador.

- **Prueba de memoria**: También con `sysbench`, se generó una carga que hace uso intensivo de la RAM. Se midieron las operaciones por segundo y la estabilidad del uso de memoria.

- **Entrada/Salida de disco**: Se utilizó el comando `dd` para escribir un archivo de 1 GB en el sistema de archivos del contenedor, sin usar la caché (`oflag=dsync`). Así se simula un uso intensivo del disco.

- **Rendimiento de red**: Con `iperf3`, se midió la velocidad de transmisión de datos y la latencia, tanto de subida como de bajada, desde el contenedor.

- **Carga de aplicación web**: Se desarrolló una aplicación sencilla en Node.js expuesta en el puerto 3000. Se lanzaron 1000 peticiones concurrentes con `ab` para evaluar cómo responde bajo carga.

## 4. Resultados comparativos

### Tiempo de arranque

- **Docker local**: arranca en unos 1.2 segundos, prácticamente instantáneo.
- **Codespaces**: tarda entre 10 y 15 segundos debido a la preparación del entorno y la sincronización con el repositorio.

### Rendimiento de CPU

- **Docker local**: alrededor de 650 eventos por segundo, gracias al acceso directo al hardware.
- **Codespaces**: entre 480 y 520 eventos por segundo, algo más limitado por los recursos compartidos en la nube.

### Consumo de memoria

- **Docker local**: uso estable de unos 500 MB adicionales durante las pruebas.
- **Codespaces**: fluctuaciones mayores, posiblemente por procesos en segundo plano y carga compartida.

### Escritura en disco

- **Docker local**: el archivo de 1 GB se escribió entre 1.8 y 2.2 segundos.
- **Codespaces**: el mismo proceso tardó entre 3.5 y 6 segundos, afectado por la sobrecarga del sistema de archivos virtual.

### Rendimiento de red

- **Docker local**: velocidad media de 940 Mbps con latencia mínima.
- **Codespaces**: entre 100 y 300 Mbps, con latencias de hasta 60–100 ms.

## 5. Análisis comparativo

En general, Docker ejecutado en local ofrece un rendimiento notablemente superior, especialmente en tareas exigentes. Al estar cerca del hardware, se reducen las capas intermedias y se aprovechan mejor los recursos.

Por otro lado, GitHub Codespaces no está pensado para maximizar el rendimiento, sino para ofrecer comodidad, portabilidad y una puesta en marcha casi inmediata desde cualquier parte. Aunque es más lento, es ideal para colaborar o empezar a trabajar sin complicaciones.

### Resumen:

- **Docker local**: ideal si necesitas control total, pruebas exigentes o trabajas en entornos con poca conectividad.
- **Codespaces**: perfecto para equipos distribuidos, formación, despliegue rápido y colaboración sin necesidad de configuración.

## 6. Conclusión: ¿Cuándo conviene usar cada uno?

### Docker en local

Úsalo cuando:

- Necesites el mejor rendimiento posible.
- Trabajes sin conexión a internet.
- Requieras tiempos de respuesta bajos.
- Busques estabilidad en el uso de memoria y disco.

### GitHub Codespaces

Recomendado si:

- Priorizas la portabilidad del entorno.
- Trabajas en equipo de forma remota.
- Quieres evitar instalaciones y configuraciones locales.
- Te interesa una solución rápida y cómoda para empezar a trabajar de inmediato.

---

## 🛠 Cómo ejecutar este proyecto

Clona el repositorio:

```bash
git clone https://github.com/tuusuario/vm-vs-docker-benchmark.git
cd vm-vs-docker-benchmark
