### Bitnami Wordpress

- Bitnami Docker Compose

- url https://github.com/bitnami/bitnami-docker-wordpress/blob/master/docker-compose.yml

- Docker Build

```
docker build -t quickbooks2018/eks-wordpress:latest .
```

- Docker Run

```
docker run --name wordpress -p 80:80 -id quickbooks2018/eks-wordpress:latest
```