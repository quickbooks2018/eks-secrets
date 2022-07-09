FROM nginx:latest

RUN apt update -y && apt install -y awscli jq

COPY secrets.sh /secrets.sh

RUN chmod +x /secrets.sh

ENTRYPOINT ["/bin/bash", "-c" , "/docker-entrypoint.sh && /secrets.sh"]
