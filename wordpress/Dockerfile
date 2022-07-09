FROM wordpress:latest

RUN apt-get update -y && apt-get update install -y awscli jq supervisor procps

COPY secrets.sh /secrets.sh

RUN chmod +x /secrets.sh

COPY supervisord.conf /etc/supervisord.conf

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]