#!/bin/sh

set -x


curl "http://client/router/health" || echo 'client failed!'
curl "http://router/metrics" || echo 'router failed!'
curl "http://web_service/health" || echo 'web_service failed!'

echo '********************************************************'
echo 'starting tests'
echo '********************************************************'

curl "http://client:80/router/ps-sample/hello" 
curl "http://router/ps-sample/hello" 
#ab -c 1 -t 10 "http://router/ps-sample/hello"
