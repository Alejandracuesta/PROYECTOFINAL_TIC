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
