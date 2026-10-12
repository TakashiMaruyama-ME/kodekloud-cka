# Question
A PersistentVolumeClaim named app-pvc exists in the namespace storage-ns, but it is not getting bound to the available PersistentVolume named app-pv.

Inspect both the PVC and PV and identify why the PVC is not being bound and fix the issue so that the PVC successfully binds to the PV. Do not modify the PV resource.


- [ ] Is PVC correctly bound to PV?

# Solution
Use kubectl describe and check the PVC and PV details to identify the issue.

  1. Inspect both resources:
```
kubectl describe pv app-pv
kubectl describe pvc app-pvc -n storage-ns
```
  2. Note that there is accessModes mismatch between PV and PVC objects. Flush the PVC in a yaml file to be able to update it:
```
kubectl get pvc app-pvc -n storage-ns -o yaml > pvc.yaml
```

  3. Update the access mode on pvc.yaml:
```
# vi pvc.yaml

apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: app-pvc
  namespace: storage-ns
spec:
  accessModes:
    - ReadWriteOnce        # fix access mode to match PV object
  resources:
    ...
```
  4. Delete and re-create the pvc object
```
kubectl delete pvc -n storage-ns app-pvc
kubectl apply -f pvc.yaml
```
  5. Verify the status of the PVC is showing as Bound:
```
kubectl get pvc app-pvc -n storage-ns
```