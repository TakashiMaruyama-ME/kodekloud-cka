# Question
Deploy a Vertical Pod Autoscaler (VPA) with name analytics-vpa for the deployment named analytics-deployment in the default namespace.
The VPA should automatically adjust the CPU and memory requests of the pods to optimize resource utilization. Ensure that the VPA operates in Recreate mode, allowing it to evict and recreate pods with updated resource requests as needed.

- [ ] Is the VPA analytics-vpa created for deployment analytics-deployment?
- [ ] Is the updatePolicy set to Recreate mode for deployment analytics-deployment?

# Solution
Use the below YAML file to create the VPA for deployment analytics-deployment
```
kubectl create -n default -f - <<EOF
apiVersion: autoscaling.k8s.io/v1
kind: VerticalPodAutoscaler
metadata:
  name: analytics-vpa
  namespace: default
spec:
  targetRef:
    apiVersion: apps/v1
    kind: Deployment
    name: analytics-deployment
  updatePolicy:
    updateMode: "Recreate"
EOF
```
