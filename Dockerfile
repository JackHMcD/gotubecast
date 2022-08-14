FROM golang:alpine

COPY entrypoint.sh .

RUN ["chmod", "+x", "entrypoint.sh"]
ENTRYPOINT ["sh", "entrypoint.sh"]
