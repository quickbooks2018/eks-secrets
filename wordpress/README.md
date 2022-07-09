### Bitnami Wordpress

- Bitnami Docker Compose

- url https://github.com/bitnami/bitnami-docker-wordpress/blob/master/docker-compose.yml

- Docker Build

```
docker build -t quickbooks2018/eks-wordpress:latest .
```

- Docker Run

```
docker network create wordpress --attachable

docker run --name phpmyadmin --network=wordpress -e PMA_HOST=wordpress-instance-1.cusuix4sg7it.us-east-1.rds.amazonaws.com -id -p 8080:80 --restart unless-stopped phpmyadmin/phpmyadmin

docker run --name wordpress --network wordpress -p 80:80 -id quickbooks2018/eks-wordpress:latest
```