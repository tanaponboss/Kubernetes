# Read me 

## Setup
> **Credits to**: Bam and EQ for debuging

### Todo
- Ask ajarn about the port and target port config
  - Why how what on port 80!?
  - port target port is the internal port for the pod
  - replicas

## To set up Private Access Token PAT for ghcr.io:
Go to Setting -> Developer Setting -> classic token -> create and allow Read/Write/Delete 

```sh
kubectl create secret docker-registry my-registry-credentials --docker-server=ghcr.io --docker-username=tanaponboss --docker-password=classic_token --docker-email=<email>
```

## In the back/frontend deployment set the spec under template as
    spec:
      imagePullSecrets:
        - name: my-registry-credentials

## install Traefix
```sh
helm repo add traefik https://traefik.github.io/charts
curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash
helm repo add traefik https://traefik.github.io/charts
helm repo update
helm install traefik traefik/traefik
```

> **To start k8s**:
```sh
kubectl delete -f .
helm uninstall traefik traefik/traefik
helm install traefik traefik/traefik
kubectl apply -f .
```
Need to reinstall traefix because when delete -f . traefix pod will also get deleted

> **Debug:**:
```sh
kubectl get po 
kubectl get services
kubectl get deployments
kubectl describe po
kubectl describe services
kubectl describe deployments
kubectl logs traefik-77f8d8ff7-hj9cf
kubectl logs -p traefik-77f8d8ff7-hj9cf
kubectl rollout restart pod p1-backend-565ddcf456-tp8v5
kubectl delete service ...
kubectl delete deployment ...
```# scalable-23t1-p1-tanaponboss
scalable-23t1-p1-tanaponboss created by GitHub Classroom
