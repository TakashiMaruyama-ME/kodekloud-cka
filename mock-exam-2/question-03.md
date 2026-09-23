# Question
From student-node `ssh cluster1-controlplane` to solve this question.

A Deployment named `webapp-deploy` is running in the `ingress-ns` namespace and is exposed via a Service named `webapp-svc`.

Create an Ingress resource called `webapp-ingress` in the same namespace that will route traffic to the service. The Ingress must:

Use `pathType: Prefix`
Route requests sent to path `/` to the backend service
Forward traffic to port `80` of the service
Be configured for the host `kodekloud-ingress.app`

Test app availablility using the following command:
```
curl -s http://kodekloud-ingress.app/
```

- [ ] Ingress exposed and serving traffic via kodekloud-ingress.app host

# Solution