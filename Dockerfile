FROM golang:alpine

RUN apk add --no-cache --upgrade bash

WORKDIR ${GOPATH}/src/github.com/jackhmcd/gotubecast/
COPY . ${GOPATH}/src/github.com/jackhmcd/gotubecast/

RUN go get -v .
RUN go install -i .


RUN ["chmod", "+x", "entrypoint.sh"]
ENTRYPOINT ["./entrypoint.sh"]
