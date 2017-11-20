#!/bin/sh


curl "http://client/router/health" || echo 'client failed!'
curl "http://router/health" || echo 'router failed!'

echo 'checking config server'
curl "http://config_server/health" || echo 'config_server failed!'
curl "http://config_server/config-repo/application-docker"

echo 'checking web service directly \n'
curl "http://web_service/health" || echo 'web_service failed!'
curl "http://web_service/hello" 

echo 'checking router health \n'
curl "http://router/health" || echo 'web_service failed!'
echo 'checking router connectivity to web service \n'
curl "http://router/ps-sample/hello" 


echo 'checking client connectivity ... \n'
curl 'http://client/router/health'
curl "http://client/router/ps-sample/hello" 
