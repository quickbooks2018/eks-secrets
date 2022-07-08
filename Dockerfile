FROM nginx:latest

RUN apt update -y && apt install -y awscli jq

COPY secrets.sh /secrets.sh

RUN chmod +x /secrets.sh

CMD ["bash","-c","nginx -g daemon off; source /secrets.sh"]


