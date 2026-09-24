# Question
From student-node `ssh cluster1-controlplane` to solve this question.

Create a new deployment called `nginx-deploy`, with image `nginx:1.16` and `1` replica. Next, upgrade the deployment to version `1.17` using rolling update.

- [ ] Deployment: nginx-deploy, Image: nginx:1.16
- [ ] Image: nginx:1.16
- [ ] Version upgraded to 1.17

# Solution
Explore the --record option while creating the deployment while working with the deployment definition file. Then make use of the kubectl apply command to create or update the deployment.

To create a deployment definition file nginx-deploy:

```kubectl create deployment nginx-deploy --image=nginx:1.16 --dry-run=client -o yaml > deploy.yaml```

To create a resource from definition file and to record:

```kubectl apply -f deploy.yaml --record```

To view the history of deployment nginx-deploy:

```kubectl rollout history deployment nginx-deploy```

To upgrade the image to next given version:

```kubectl set image deployment/nginx-deploy nginx=nginx:1.17 --record```

To view the history of deployment nginx-deploy:

kubectl rollout history deployment nginx-deploy
# My Solution
```
k create deploy nginx-deploy --imagenginx:1.16 --replicas=1
```
```
k set image deploy nginx-deploy nginx=nginx:1.17
```