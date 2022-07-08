## cloudgeeks.ca

- https://hub.docker.com/_/nginx

- Nginx Container

```nginx
docker run --name nginx -id nginx:latest
```

- Docker Build

```build
docker build -t quickbooks2018/eks-secrets:latest .
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
