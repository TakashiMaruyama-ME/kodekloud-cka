# Question
Create a Horizontal Pod Autoscaler (HPA) with name `webapp-hpa` for the deployment named `kkapp-deploy` in the **default namespace** with the `webapp-hpa.yaml` file located under the root folder.
Ensure that the HPA scales the deployment based on **CPU utilization**, maintaining an average CPU usage of **50%** across all pods.
Configure the HPA to **cautiously scale down** pods by setting a **stabilization window of 300 seconds** to prevent rapid fluctuations in pod count.

Note: The kkapp-deploy deployment is created for backend; you can check in the terminal.

- [ ] Is the HPA webapp-hpa deployed?
- [ ] Is the deployment configured for metrics CPU Utilization?
- [ ] Is the stabilization window set to 300 seconds?

# Solution
Under /root/ folder you will find a yaml file webapp-hpa.yaml. Update the yaml file as per task given.
```
apiVersion: autoscaling/v2
kind: HorizontalPodAutoscaler
metadata:
  name: webapp-hpa
  namespace: default
spec:
  scaleTargetRef:
    apiVersion: apps/v1
    kind: Deployment
    name: kkapp-deploy
  minReplicas: 2
  maxReplicas: 10
  metrics:
  - type: Resource
    resource:
      name: cpu
      target:
        type: Utilization
        averageUtilization: 50
  behavior:
    scaleDown:
      stabilizationWindowSeconds: 300
```

Use below command
```
kubectl create -f webapp-hpa.yaml
```
**Note:**
There is an imperative command to create the yaml but, `stabilizationWindowSeconds: 300` has to be edited manually.
```
kubectl autoscale deploy kkapp-deploy \
  --namespace=default \
  --name=webapp-hpa \
  --min=2 \
  --max=10 \
  --cpu=50% \
  --dry-run=client \
  -o yaml > hpa.yml
```
The ref for `stabilizationWindowSeconds: 300`
https://kubernetes.io/docs/concepts/workloads/autoscaling/horizontal-pod-autoscale/#stabilization-window
