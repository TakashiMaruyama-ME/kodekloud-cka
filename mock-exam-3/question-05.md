# Question
Create a PriorityClass named low-priority with a value of 50000. A pod named lp-pod exists in the namespace low-priority. Modify the pod to use the priority class you created. Recreate the pod if necessary.


- [ ] Is the PriorityClass low-priority created?
- [ ] Low priority class value is set properly to 50000
- [ ] Pod lp-pod uses the low-priority PriorityClass

# Solution
Use kubectl apply to create the PriorityClass, then edit the existing pod to add the priority class.

  1. Create the priority class manifest file pc.yaml
```
apiVersion: scheduling.k8s.io/v1
kind: PriorityClass
metadata:
  name: low-priority
value: 50000
globalDefault: false
description: "Low priority class"
```

  2. Apply the manifest file
```
kubectl apply -f pc.yaml
```

  3. Inspect the pod definition to be able to recreate it:
```
kubectl get pod lp-pod -n low-priority -o yaml
```

  4. Create and update the new yaml lp-pod.yaml for the pod after adding the priority class:
```
# vi lp-pod.yaml

apiVersion: v1
kind: Pod
metadata:
  name: lp-pod
  namespace: low-priority
spec:
  priorityClassName: low-priority
  containers:
  - name: nginx
    image: nginx
```

  4. Delete and recreate the pod using the configured priority class
```
kubectl delete pod lp-pod -n low-priority
kubectl apply -f lp-pod.yaml
```