FROM nginx:latest

COPY secrets.sh /secrets.sh

RUN chmod +x /secret.sh

COPY docker-entrypoint.sh /docker-entrypoint.sh


