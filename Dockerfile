FROM nginx:latest

COPY secrets.sh /secrets.sh

RUN chmod +x /secrets.sh

COPY docker-entrypoint.sh /docker-entrypoint.sh

RUN chmod +x /docker-entrypoint.sh


