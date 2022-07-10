FROM wordpress:latest

RUN apt update -y && apt install -y awscli jq supervisor procps

COPY secrets.sh /secrets.sh

RUN chmod +x /secrets.sh

COPY supervisord.conf /etc/supervisord.conf                       
                                                                            
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]