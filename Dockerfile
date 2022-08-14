FROM golang

COPY install-packages.sh .
RUN ["chmod", "+x", "install-packages.sh"]
RUN ./install-packages.sh

WORKDIR ${GOPATH}/src/github.com/jackhmcd/gotubecast/
COPY . ${GOPATH}/src/github.com/jackhmcd/gotubecast/

RUN go get -v .
RUN go install -i .

RUN ["chmod", "+x", "entrypoint.sh"]
ENTRYPOINT ["sh","entrypoint.sh"]
