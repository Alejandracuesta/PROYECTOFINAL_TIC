# 🧪 Evaluación comparativa de rendimiento: Docker local vs GitHub Codespaces

Este proyecto tiene como objetivo comparar el rendimiento de entornos de desarrollo que utilizan contenedores Docker localmente frente a GitHub Codespaces, una solución basada en la nube. 

---

##  Estructura del repositorio

El proyecto está organizado en varias carpetas:

- La carpeta `bench` contiene los scripts que ejecutan diferentes pruebas de rendimiento.
- El archivo `README.md` documenta el objetivo del proyecto, las pruebas realizadas.

---

## 🚀 Descripción de los scripts

**Prueba de CPU:**  
Uso una herramienta de benchmark para medir cuántos eventos por segundo puede procesar el sistema. Ésto permite comparar la potencia de cómputo entre entornos.

**Prueba de disco:**  
Simula escritura de un archivo grande en el sistema de archivos para evaluar la velocidad de escritura del disco.

**Prueba de memoria:**  
Se genera una carga controlada sobre la memoria RAM para observar cómo se comporta el entorno frente a una demanda intensiva de memoria.

**Prueba de red:**  
Se mide la velocidad de transferencia de datos y la latencia entre el contenedor y su entorno mediante una herramienta de análisis de red.

**Prueba de aplicación real:**  
Se ejecuta una pequeña aplicación Node.js y se simula tráfico concurrente para medir cuántas peticiones por segundo puede manejar, así como el tiempo de respuesta promedio.

**Medición del tiempo de arranque:**  
Se mide el tiempo que tarda el entorno en estar completamente listo desde el momento en que se lanza el contenedor o se inicia el entorno de Codespace.

---

## 🧪 Requisitos para ejecutar el proyecto

Para ejecutar estas pruebas necesitas tener instalado:

- Docker, para poder lanzar contenedores.
- Herramientas de benchmark como `sysbench`, `stress`, `iperf3`, y `ab`.

Estas herramientas deben estar presentes tanto en un entorno local como en Codespaces para asegurar que las comparaciones sean justas.

---

## ▶️ Cómo se ejecuta el proyecto

Una vez dentro del entorno (ya sea Docker o Codespaces), puedes ejecutar cada una de las pruebas de forma manual. Ésto se hace ejecutando los scripts de la carpeta `bench` uno a uno. Cada script registra los resultados en la consola.

---

## 📌 Objetivo del proyecto

Este proyecto se encarga de dar una evaluación objetiva sobre las diferencias entre ejecutar contenedores Docker de forma local contra utilizar un entorno virtualizado como GitHub Codespaces. Determino:

- Qué tan rápido responde cada entorno.
- Cómo manejan la carga computacional.
- Qué diferencias hay en cuanto al acceso a disco y red.
- Cómo se comportan en escenarios prácticos con aplicación real.

---

## ✅ Resultados esperados

Después de ejecutar todas las pruebas, se espera tener una visión más acertada sobre:

- La velocidad de arranque de cada entorno.
- La capacidad de procesamiento de CPU en ambos casos.
- La estabilidad y uso de memoria.
- Las velocidades de escritura en disco y de transmisión de red.
- El rendimiento de una aplicación en condiciones reales de uso.

Mediante estos datos sabrás de antemano cuál de estos dos entornos te vendría mejor dependiendo de tu necesidades.

---

