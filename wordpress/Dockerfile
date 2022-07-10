FROM bitnami/wordpress-nginx:latest

## Change user to perform privileged actions
USER 0
## Install 'vim'
RUN install_packages awscli jq supervisor procps

COPY secrets.sh /etc/profile.d/secrets.sh

RUN chmod +x /etc/profile.d/secrets.sh && chown 1001:1001 /etc/profile.d/secrets.sh

COPY supervisord.conf /etc/supervisord.conf                       # for testing secrets will should be stored in wordpress.txt                 

RUN > /supervisord.log && chown 1001:1001 /supervisord.log && > /etc/profile.d/wordpress.txt && chown 1001:1001 /etc/profile.d/wordpress.txt && > /supervisord.pid && chown 1001:1001 /supervisord.pid

## Revert to the original non-root user
USER 1001


CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]