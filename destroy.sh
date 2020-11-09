#!/bin/bash
set -e
 
#docker-compose -f docker-compose_nonetwork.yml down --volumes
###### old previous --> docker-compose down --volumes
docker-compose -f docker-compose-machined.yml down --volumes
#docker rmi web_apache_img web_php_img 
#docker rmi wom_web
# dont remove mysql to keep data changes
#docker rmi mysql55_img