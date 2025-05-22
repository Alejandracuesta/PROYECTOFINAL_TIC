# Dockerfile
FROM openjdk:17-slim
RUN apt update && apt install -y sysbench git curl procps x11-apps \
    && pip install jupyter matplotlib psutil
WORKDIR /app
COPY . .
CMD ["java", "-cp", "pacman/src", "PacManGame"]
