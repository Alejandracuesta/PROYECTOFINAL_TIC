# Evaluación comparativa de rendimiento: Máquina Virtual vs Docker

## 1. Introducción

- **Máquinas Virtuales (VM)**: Ejecutan sistemas operativos completos sobre un hipervisor. Aíslan completamente recursos del sistema.
- **Docker (Contenedores)**: Ejecutan procesos en contenedores que comparten el kernel del host, son más ligeros pero con menos aislamiento.

## 2. Configuración del entorno

- **Host**: Ubuntu 22.04, 8GB RAM, 4 vCPU
- **VM**: Ubuntu 22.04 en VirtualBox
- **Docker**: Imagen base Ubuntu 22.04

## 3. Métricas evaluadas

| Métrica              | Herramienta        |
|----------------------|--------------------|
| Uso de CPU           | sysbench           |
| Consumo de RAM       | top, docker stats  |
| E/S de Disco         | dd                 |
| Red                  | iperf3             |
| Tiempo de arranque   | script de timestamp|
| Rendimiento de app   | ab, curl           |

## 4. Resultados

Se incluyen en la carpeta `/results`. Visualización futura mediante `utils/analyze_results.py`.

## 5. Análisis

| Aspecto        | VM                              | Docker                           |
|----------------|----------------------------------|----------------------------------|
| Aislamiento    | Alto (kernel separado)           | Medio (kernel compartido)       |
| Ligereza       | Pesada (OS completo)             | Ligero (sólo dependencias)      |
| Portabilidad   | Menor                            | Alta (multi-OS)                 |
| Inicio         | Lento (~20s)                     | Rápido (~1s)                    |
| Seguridad      | Fuerte, por separación completa  | Menos seguro sin hardening extra|

## 6. Conclusión

- Usa **VMs** cuando necesitas un entorno completamente aislado, probar múltiples OS o dependes de características de kernel.
- Usa **Docker** cuando priorizas velocidad, ligereza y escalabilidad en desarrollo o despliegue CI/CD.

---

## 🔧 Cómo usar este repositorio

1. Clona el repo
2. Usa Codespaces o buildea el contenedor:
   ```bash
   docker build -t benchmark .
   docker run -it --rm benchmark
