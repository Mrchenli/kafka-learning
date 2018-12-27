#!/usr/bin/env bash

echo "pull images ..."
docker pull wurstmeister/zookeeper
docker pull wurstmeister/kafka:latest
docker pull maauso/zkui
docker pull junxy/kafkaoffsetmonitor
echo "pull images over"

echo "create kafka_cluster networks ..."
docker network create --driver overlay --subnet 10.0.6.0/24 kafka_cluster
echo "create kafka_cluster networks finished"

echo "docker stack deploy zookeeper ..."
cd zookeeper
docker stack deploy -c docker-compose.yml  kafka_cluster --resolve-image changed --with-registry-auth
cd ..
sleep 5s
echo "docker stack deploy zookeeper finished"

echo "docker stack deploy kafka_cluster ..."
cd kafka
docker stack deploy -c docker-compose.yml  kafka_cluster --resolve-image changed --with-registry-auth
cd ..
echo "kafka_cluster is up ... "
