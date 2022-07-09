FROM docker.io/bitnami/wordpress:latest

RUN apt update -y && apt install -y awscli jq supervisor procps

COPY secrets.sh /secrets.sh

RUN chmod +x /secrets.sh

COPY supervisord.conf /etc/supervisord.conf

EXPOSE 8080 8443

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]