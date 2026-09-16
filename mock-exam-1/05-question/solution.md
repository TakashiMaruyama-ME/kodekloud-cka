# Question
Create a deployment named `hr-web-app` using the image `kodekloud/webapp-color` with `2` replicas.

- [ ] Name: hr-web-app
- [ ] Image: kodekloud/webapp-color

Replicas: 2
# Solution
Run the command: 
```
kubectl create deployment  hr-web-app --image=kodekloud/webapp-color --replicas=2
```
