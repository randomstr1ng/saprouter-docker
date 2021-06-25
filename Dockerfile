FROM ubuntu:20.04

ENV LC_CTYPE C.UTF-8
ENV DEBIAN_FRONTEND noninteractive

RUN apt update && apt install -yq curl

# Setup SAP Router
RUN mkdir -p /opt/saprouter
RUN curl https://raw.githubusercontent.com/randomstr1ng/static-files/master/saprouter_linux/saprouter -o /opt/saprouter/saprouter && chmod +x /opt/saprouter/saprouter
RUN curl https://raw.githubusercontent.com/randomstr1ng/static-files/master/saprouter_linux/niping -o /opt/saprouter/niping && chmod +x /opt/saprouter/niping

# add example SAPROUTTAB
RUN echo -n "IwlTb3VyY2UJRGVzdAlTZXJ2aWNlClAJKgkqCSoKUAkqCSoJMjIK" |base64 -d > /tmp/test
RUN mv /tmp/test /opt/saprouter/saprouttab

EXPOSE 3299
WORKDIR /opt/saprouter
CMD ["/opt/saprouter/saprouter","-r","-G","/opt/saprouter/router.log","-R","/opt/saprouter/saprouttab"]