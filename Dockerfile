FROM amd64/alpine
WORKDIR /app
RUN wget https://github.com/prometheus/node_exporter/releases/download/v1.1.2/node_exporter-1.1.2.linux-amd64.tar.gz && \
    tar -xzf node_exporter-1.1.2.linux-amd64.tar.gz && \
    mv node_exporter-1.1.2.linux-amd64 node_exporter && \
    wget https://github.com/prometheus/prometheus/releases/download/v2.27.0/prometheus-2.27.0.linux-amd64.tar.gz && \
    tar -xzf prometheus-2.27.0.linux-amd64.tar.gz && \
    mv prometheus-2.27.0.linux-amd64 prometheus && \
    rm -rf node_exporter-1.1.2.linux-amd64.tar.gz prometheus-2.27.0.linux-amd64.tar.gz

COPY src/ /app/

RUN mkdir /etc/prometheus && \
 mkdir /var/lib/prometheus

COPY ./prometheus.yml /etc/prometheus/prometheus.yml

RUN cp -r ./prometheus/consoles /etc/prometheus/ && \
 cp -r ./prometheus/console_libraries /etc/prometheus/ && \
 mv ./prometheus/prometheus /usr/local/bin/ && \
 mv ./prometheus/promtool /usr/local/bin/ && \
 cp node_exporter/node_exporter /usr/local/bin/ && \
 rm -rf ./node_exporter ./prometheus && \
 chmod -R 777 /etc/prometheus /usr/local/bin/prometheus /usr/local/bin/promtool /usr/local/bin/node_exporter /var/lib/prometheus

EXPOSE 9090
EXPOSE 3000
CMD ["./main.sh"]
