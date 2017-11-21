#!/bin/sh


curl "http://client/router/health" || echo 'client failed!'
curl "http://router/metrics" || echo 'router failed!'
curl "http://web-service/health" || echo 'web_service failed!'

echo '********************************************************'
echo 'starting tests'
echo '********************************************************'

curl "http://client:80/router/service-a/hello" 
curl "http://router/ps-sample/hello" 
ab -c 1 -t 10 "http://router/service-a/hello"
