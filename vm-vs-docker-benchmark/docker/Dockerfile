FROM ubuntu:22.04

RUN apt update && \
    apt install -y sysbench iperf3 apache2-utils curl net-tools

COPY ../bench /bench
COPY ../scripts /scripts

CMD ["/bin/bash"]
