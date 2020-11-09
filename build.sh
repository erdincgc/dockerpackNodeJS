#!/bin/bash
set -e
#source .env
export COMPOSE_PROJECT_NAME=zonechat
export COMPOSE_WEBSERVER=nodejs # nginx / apache2
export COMPOSE_FILE="docker-compose-linux.yml" # nodejs / nginx / apache2
export DATA_CONTAINER=mongo # mysql57 / mysql8
echo "========================================= DOCKER COMPOSE STARTED ==========================================";

if ! [[ -d logs/${COMPOSE_WEBSERVER} ]]; then
    mkdir -p logs/${COMPOSE_WEBSERVER}
fi
 
if ! [[ -d logs/mongodb ]]; then
    mkdir -p logs/mongodb
fi
 
if ! [[ -d logs/nodejs ]]; then
    mkdir -p logs/nodejs
fi


docker-compose -f ${COMPOSE_FILE} down;
#docker network rm ${COMPOSE_PROJECT_NAME}_default
#docker network create ${COMPOSE_PROJECT_NAME}_default
#docker network connect ${COMPOSE_PROJECT_NAME}_default ${COMPOSE_WEBSERVER}_img
sleep 1;

###export IS_DATA_CONTAINER_EXISTS=$(docker volume ls | grep ${COMPOSE_PROJECT_NAME}_sqldata);

docker-compose -f ${COMPOSE_FILE} up -d ;
#docker-compose -f ${COMPOSE_FILE} up --build -d ;#webserver;
echo "======================================= CONTAINER INFORMATION START =========================================";
docker-compose -f ${COMPOSE_FILE} ps;
echo "======================================= CONTAINER INFORMATION END ===========================================";


#if [[ ! $IS_DATA_CONTAINER_EXISTS ]]; then
#  echo "=================================== DATA CONTAINER IS NOT READY !   ====================================";

#    docker-compose -f ${COMPOSE_FILE} build -d ${DATA_CONTAINER};
#    while [[ ! $(docker-compose -f ${COMPOSE_FILE} logs | grep -P "mysqld: ready for connections| MySQL init process done. Ready for start up.") ]];
#    do
#      echo "================ Waiting for 10 more seconds for MySQL Container to get ready!   ====================";
#      sleep 10;
#    done;
#fi;
export GID=$(id -g);

#docker-compose -f ${COMPOSE_FILE} up -d --build --force-recreate --no-deps
#sleep 1
#docker exec ${COMPOSE_PROJECT_NAME}_${COMPOSE_WEBSERVER}a chown -R root:www-data ../../${COMPOSE_DOMAIN_NAME}
#docker exec ${COMPOSE_PROJECT_NAME}_${COMPOSE_WEBSERVER} sh -c "chmod -R 755 /var/www/html"
#docker exec ${COMPOSE_PROJECT_NAME}_${COMPOSE_WEBSERVER} sh -c "chmod 775 /var/www/html/cache/ci_sessions/ /var/www/html/cache/logs /var/www/html/cache"
#docker exec ${COMPOSE_PROJECT_NAME}_${COMPOSE_WEBSERVER} sh -c "chown -R www-data:www-data /var/www/html/cache/ci_sessions/"
#docker exec ${COMPOSE_PROJECT_NAME}_php_con chown -R root:www-data //usr/local/etc/logs

exit
