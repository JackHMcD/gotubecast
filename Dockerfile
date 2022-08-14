FROM golang

COPY install-packages.sh .
RUN ["chmod", "+x", "install-packages.sh"]
RUN ./install-packages.sh

WORKDIR ${GOPATH}/src/github.com/jackhmcd/gotubecast/
COPY . ${GOPATH}/src/github.com/jackhmcd/gotubecast/

RUN go get -v .
RUN go install -i .

RUN pwd
RUN ls
RUN ["chmod", "+x", "entrypoint.sh"]
ENTRYPOINT go/src/github.com/jackhmcd/gotubecast/entrypoint.sh
