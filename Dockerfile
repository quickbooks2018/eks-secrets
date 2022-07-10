FROM bitnami/wordpress-nginx:latest

## Change user to perform privileged actions
USER 0
## Install 'vim'
RUN install_packages awscli jq supervisor procps

COPY secrets.sh /secrets.sh

RUN chmod +x /secrets.sh

COPY supervisord.conf /etc/supervisord.conf


## Revert to the original non-root user
USER 1001


CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]