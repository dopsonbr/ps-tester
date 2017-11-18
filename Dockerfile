FROM alpine:latest

RUN apk --no-cache add apache2-utils curl
COPY load_test.sh /load_test.sh
