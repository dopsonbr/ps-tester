#!/bin/sh


echo 'checking config server'
curl "http://localhost:8888/health" || echo 'config_server failed!'
curl "http://localhost:8888/config-repo/application-docker"

echo 'checking web service directly \n'
curl "http://localhost:8080/health" || echo 'web_service failed!'
curl "http://localhost:8080/hello" 

echo 'checking router health \n'
curl "http://localhost:8060/health" || echo 'web_service failed!'
echo 'checking router connectivity to web service \n'
curl "http://localhost:8060/service-a/hello" 


