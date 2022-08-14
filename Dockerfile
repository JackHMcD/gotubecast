FROM golang

COPY install-packages.sh .
RUN ["chmod", "+x", "install-packages.sh"]
RUN ./install-packages.sh

COPY entrypoint.sh /entrypoint.sh
RUN ["chmod", "+x", "/entrypoint.sh"]
ENTRYPOINT ["/entrypoint.sh"]
CMD ["sh"]
