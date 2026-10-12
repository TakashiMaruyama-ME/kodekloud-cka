# Question
Create a ConfigMap named app-config in the namespace cm-namespace with the following key-value pairs:

```
ENV=production
LOG_LEVEL=info
```

Then, modify the existing Deployment named cm-webapp in the same namespace to use the app-config ConfigMap by setting the environment variables ENV and LOG_LEVEL in the container from the ConfigMap.


- [ ] ConfigMap app-config is created
- [ ] Deployment uses the app-config ConfigMap for variable ENV and LOG LEVEL
- [ ] Are the environment variables reflected in the deployment?
- [ ] ConfigMap has proper ENV value
- [ ] ConfigMap has proper LOG_LEVEL value

# Solution
Use kubectl create configmap to create the ConfigMap and kubectl set env to modify the deployment to use the ConfigMap.

  1. Create the ConfigMap:
```
kubectl create configmap app-config -n cm-namespace \
  --from-literal=ENV=production \
  --from-literal=LOG_LEVEL=info
```
  2. Patch the deployment to use the config:
```
kubectl set env deployment/cm-webapp -n cm-namespace \
  --from=configmap/app-config
  ```