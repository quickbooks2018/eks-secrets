###  Redmine

- cloudgeeks.ca

- Docker Build

```
docker build -t quickbooks2018/eks-redmine:latest .
```

- Docker Run

```

docker run --name phpmyadmin -e PMA_HOST=redmine-instance-1.cobu8fxaskvl.us-east-1.rds.amazonaws.com -id -p 8080:80 --restart unless-stopped phpmyadmin/phpmyadmin

apt update -y && apt install -y awscli jq

source secrets.sh

docker run --name redmine --env-file=/secrets -p 80:3000 --restart unless-stopped -id quickbooks2018/eks-redmine:latest
```

- docker-compose

```redmine
docker compose -p redmine up -d
```
- Docker Hub Redmine

- url https://hub.docker.com/_/redmine?tab=tags

- My Sql client
- docker run --name mysql-client -it --rm -e MYSQL_ALLOW_EMPTY_PASSWORD=true mysql:5.7 bash
- mysql -h wordpress-instance-1.cogke6h6hkax.us-east-1.rds.amazonaws.com -u admin -p
- show schemas;
- create schema redmine;

- Environment Variables
- url https://unix.stackexchange.com/questions/8342/export-an-env-variable-to-be-available-at-all-sub-shells-and-possible-to-be-mod

- https://stackoverflow.com/questions/1641477/how-to-set-environment-variable-for-everyone-under-my-linux-system

- https://superuser.com/questions/1308298/setting-variable-in-etc-environment-has-no-effect

- https://stackoverflow.com/questions/65593487/set-env-variables-for-all-the-users-is-not-working-in-docker