# Question
Expose the `hr-web-app` created in the previous task as a service named `hr-web-app-service`, accessible on port `30082` on the nodes of the cluster.

The web application listens on port 8080.

- [ ] Name: hr-web-app-service
- [ ] Type: NodePort
- [ ] Endpoints: 2
- [ ] Port: 8080
- [ ] NodePort: 30082

# Solution
Run the command to generate a service definition file: 
```
kubectl expose deployment hr-web-app \
  --type=NodePort \
  --port=8080 \
  --name=hr-web-app-service \
  --dry-run=client \
  -o yaml > hr-web-app-service.yaml 
```
Now, in generated service definition file add the nodePort field with the given port number under the ports section and create a service.
