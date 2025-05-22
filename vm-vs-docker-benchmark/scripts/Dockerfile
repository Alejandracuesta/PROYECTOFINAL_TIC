FROM openjdk:17-slim
RUN apt update && apt install -y x11-apps sysbench git curl procps \
    && pip install --upgrade pip \
    && pip install jupyter matplotlib psutil

WORKDIR /app
COPY . .

CMD ["java", "-cp", "pacman/src", "pacman.PacManGame"]
