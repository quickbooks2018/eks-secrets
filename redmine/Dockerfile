FROM redmine:latest

RUN apt update -y && apt install -y awscli jq procps

COPY secrets.sh /secrets.sh

RUN chmod +x /secrets.sh

CMD ["bash","-c","source /secrets.sh";"rails" "server" "-b" "0.0.0.0"]