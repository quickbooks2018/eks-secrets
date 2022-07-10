FROM bitnami/wordpress-nginx:latest

## Change user to perform privileged actions
USER 0
## Install 'vim'
RUN install_packages awscli jq supervisor procps

COPY secrets.sh /secrets.sh

RUN chmod +x /secrets.sh

RUN > /secrets && chown 1001:1001 /secrets

COPY supervisord.conf /etc/supervisord.conf                       
                                                                            
RUN > /supervisord.log && chown 1001:1001 /supervisord.log && > /supervisord.pid && chown 1001:1001 /supervisord.pid

## Revert to the original non-root user
USER 1001


CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]