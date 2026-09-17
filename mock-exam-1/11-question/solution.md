# Question
Create a Kubernetes Gateway resource with the following specifications:

Name: web-gateway <br>
Namespace: nginx-gateway <br>
Gateway Class Name: nginx <br>
Listeners: <br>
  Protocol: HTTP <br>
  Port: 80 <br>
  Name: http <br>

- [ ] Is the web-gateway deployed to listen on port 80?

# Solution
Copy the below YAML file to the terminal and create a gateway resource.
```
kubectl create -n nginx-gateway -f - <<EOF
apiVersion: gateway.networking.k8s.io/v1
kind: Gateway
metadata:
  name: web-gateway
  namespace: nginx-gateway
spec:
  gatewayClassName: nginx
  listeners:
    - name: http
      protocol: HTTP
      port: 80
EOF
```
