FROM nginx:latest

RUN apt update -y && apt install -y awscli jq

COPY secrets.sh /secrets.sh

RUN chmod +x /secrets.sh

COPY docker-entrypoint.sh /docker-entrypoint.sh

RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["source", "/docker-entrypoint.sh"]


