# Question
Configure the web-route to split traffic between web-service and web-service-v2.The configuration should ensure that 80% of the traffic is routed to web-service and 20% is routed to web-service-v2.

Note: web-gateway, web-service, and web-service-v2 have already been created and are available on the cluster.


- [ ] Is the web-route deployed as HTTPRoute?
- [ ] Is the route configured to gateway web-gateway?
- [ ] Is the route configured to service web-service?

# Solution
Copy the below YAML file to the terminal and create a HTTP Route.
```
kubectl create -n default -f - <<EOF
apiVersion: gateway.networking.k8s.io/v1
kind: HTTPRoute
metadata:
  name: web-route
  namespace: default
spec:
  parentRefs:
    - name: web-gateway
      namespace: default
  rules:
    - matches:
        - path:
            type: PathPrefix
            value: /
      backendRefs:
        - name: web-service
          port: 80
          weight: 80
        - name: web-service-v2
          port: 80
          weight: 20
EOF
```