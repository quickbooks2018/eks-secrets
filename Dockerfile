FROM nginx:latest

COPY secret.sh /secret.sh

RUN chmod +x /secret.sh

COPY docker-entrypoint.sh /docker-entrypoint.sh


