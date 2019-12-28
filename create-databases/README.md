# Create databases SQL

This creates databases for DevOps tools.

## Steps

Create a namespace:

```sh
kubectl create namespace atlassian
```

Create a secret:

```sh
kubectl -n atlassian create secret generic create-databases \
  "--from-literal=host=$DEVOPS_POSTGRES_HOST" \
  "--from-literal=admin_user=$DEVOPS_POSTGRES_ROOT_USERNAME" \
  "--from-literal=admin_password=$DEVOPS_POSTGRES_ROOT_PASSWORD"
```

Apply the manifests:

```sh
kubectl -n atlassian apply -f create-databases/
```

Make sure the job has been successfully done.

```sh
kubectl -n atlassian logs -f job/create-databases
```
