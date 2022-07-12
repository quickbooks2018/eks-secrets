###  nginx

- cloudgeeks.ca

- Docker Build

```
docker build -t quickbooks2018/eks-nginx:latest .
```

- kubernetes

```
kubectl create deployment <Deplyment-Name> --image=<Container-Image>
kubectl create deployment secrets-deployment --image=quickbooks2018/eks-secrets:latest
```

- Docker Run

```

docker run --name nginx -p 80:80 --restart unless-stopped -id quickbooks2018/eks-nginx:latest

docker run --name phpmyadmin -e PMA_HOST=nginx-instance-1.cqd0k73gk4tn.us-east-1.rds.amazonaws.com -id -p 8080:80 --restart unless-stopped phpmyadmin/phpmyadmin

apt update -y && apt install -y awscli jq

source secrets.sh
```

- docker-compose

```nginx
docker compose -p nginx up -d
```
- Docker Hub nginx

- url https://hub.docker.com/_/nginx?tab=tags

- My Sql client
```mysql
docker run --name mysql-client -it --rm -e MYSQL_ALLOW_EMPTY_PASSWORD=true mysql:5.7 bash
```

```conecction
mysql -h nginx-instance-1.cqd0k73gk4tn.us-east-1.rds.amazonaws.com -u admin -p
```

```DB
show schemas;
create schema nginx;
```

- Environment Variables
- url https://unix.stackexchange.com/questions/8342/export-an-env-variable-to-be-available-at-all-sub-shells-and-possible-to-be-mod

- https://stackoverflow.com/questions/1641477/how-to-set-environment-variable-for-everyone-under-my-linux-system

- https://superuser.com/questions/1308298/setting-variable-in-etc-environment-has-no-effect

- https://stackoverflow.com/questions/65593487/set-env-variables-for-all-the-users-is-not-working-in-docker

- docker compose commands
- https://stackoverflow.com/questions/30063907/using-docker-compose-how-to-execute-multiple-commands
