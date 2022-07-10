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

docker run --name wordpress --network wordpress -p 80:8080 -id quickbooks2018/eks-wordpress:latest
```

- docker-compose

```wordpress
docker compose -p wordpress up -d
```
- Bitnami Nginx Wordpress
- url https://github.com/bitnami/bitnami-docker-wordpress-nginx
- url https://github.com/bitnami/bitnami-docker-wordpress-nginx/blob/master/6/debian-11/Dockerfile

- Environment Variables
- url https://unix.stackexchange.com/questions/8342/export-an-env-variable-to-be-available-at-all-sub-shells-and-possible-to-be-mod