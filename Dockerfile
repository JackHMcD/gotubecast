FROM golang:alpine

RUN apk add --no-cache --upgrade bash \
    vlc \
    dbus \
    xvfb

WORKDIR ${GOPATH}/src/github.com/jackhmcd/gotubecast/
COPY . ${GOPATH}/src/github.com/jackhmcd/gotubecast/

RUN go get -v .
RUN go install -i .

RUN sed -i 's/geteuid/getppid/' /usr/bin/vlc
RUN ["chmod", "+x", "entrypoint.sh"]
ENTRYPOINT ["./entrypoint.sh"]
