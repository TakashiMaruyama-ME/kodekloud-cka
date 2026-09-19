# Question
Create a service named `messaging-service` to expose the `messaging` pod within the cluster on port `6379`. The messaging pod is running in the `default` namespace.

Use imperative commands.
- [ ] Service: messaging-service
- [ ] Port: 6379
- [ ] Type: ClusterIp
- [ ] Use the right labels


# Solution
Run the command: 
```
kubectl expose pod messaging --port=6379 --name messaging-service
```

***Notes:***

type: ClusterIP is default, and does not need to be explicitly set
The question doesn't state what labels are needed.
