### Bitnami redmine

- Bitnami Docker Compose

- url https://github.com/bitnami/bitnami-docker-redmine/blob/master/docker-compose.yml

- Docker Build

```
docker build -t quickbooks2018/eks-redmine:latest .
```

- Docker Run

```
docker network create redmine --attachable

docker run --name phpmyadmin --network=redmine -e PMA_HOST=redmine-instance-1.cobu8fxaskvl.us-east-1.rds.amazonaws.com -id -p 8080:80 --restart unless-stopped phpmyadmin/phpmyadmin

apt update -y && apt install -y awscli jq

source secrets.sh

docker run --name redmine --env-file=/secrets --network redmine -p 80:3000 --restart unless-stopped -id quickbooks2018/eks-redmine:latest
```

- docker-compose

```redmine
docker compose -p redmine up -d
```
- Bitnami Nginx redmine
- url https://github.com/bitnami/bitnami-docker-redmine-nginx
- url https://github.com/bitnami/bitnami-docker-redmine-nginx/blob/master/6/debian-11/Dockerfile

- Environment Variables
- url https://unix.stackexchange.com/questions/8342/export-an-env-variable-to-be-available-at-all-sub-shells-and-possible-to-be-mod

- https://stackoverflow.com/questions/1641477/how-to-set-environment-variable-for-everyone-under-my-linux-system

- https://superuser.com/questions/1308298/setting-variable-in-etc-environment-has-no-effect

- https://stackoverflow.com/questions/65593487/set-env-variables-for-all-the-users-is-not-working-in-docker