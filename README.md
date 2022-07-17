## cloudgeeks.ca

- https://hub.docker.com/repository/docker/quickbooks2018/eks-nginx

- Nginx Container

```nginx
docker run --name nginx -id nginx:latest
```

##### Create Secret in Secret Manager

- secrets

- USERNAME=Asim
- PASSWORD=12345678

- Docker Build

```build
docker build -t quickbooks2018/eks-secrets:latest .
```

- Docker Run

```run
docker run --name secrets -id quickbooks2018/eks-secrets:latest
```
- Docker Remove Running Container

```remove
docker rm -f secrets
```

- Create a Deployment

```
kubectl create deployment <Deplyment-Name> --image=<Container-Image>
kubectl create deployment secrets-deployment --image=quickbooks2018/eks-secrets:latest
```

- Delete Deployment

```
kubectl delete deployment secrets-deployment
```

- Alpine Containers

```bash
apk update && apk add bash
```