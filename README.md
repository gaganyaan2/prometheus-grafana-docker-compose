## Docker-compose:
##### Start prometheus-grafana:

    docker-compose -f prometheus-grafana-docker-compose.yml up -d
    
##### Stop and remove prometheus-grafana:

    docker-compose -f prometheus-grafana-docker-compose.yml down
    
##### Install node_exporter to server:

    sh install_node_exporter.sh
    
##### update servers from `conf/prometheus/prometheus.yml`
