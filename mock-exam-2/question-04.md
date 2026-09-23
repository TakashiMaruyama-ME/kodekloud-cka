# Question
From student-node `ssh cluster1-controlplane` to solve this question.

Create a new deployment called `nginx-deploy`, with image `nginx:1.16` and `1` replica. Next, upgrade the deployment to version `1.17` using rolling update.

- [ ] Deployment: nginx-deploy, Image: nginx:1.16
- [ ] Image: nginx:1.16
- [ ] Version upgraded to 1.17

# Solution
```
k create deploy nginx-deploy --imagenginx:1.16 --replicas=1
```
```
k set image deploy nginx-deploy nginx=nginx:1.17
```