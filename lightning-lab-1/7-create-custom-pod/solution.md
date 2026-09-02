# Task
Create a pod called secret-1401 in the admin1401 namespace using the busybox image. The container within the pod should be called secret-admin and should sleep for 4800 seconds.

The container should mount a read-only secret volume called secret-volume at the path /etc/secret-volume. The secret being mounted has already been created for you and is called dotfile-secret.

  * Pod created correctly?

# Solution
Use the command kubectl run to create a pod definition file. Add secret volume and update container name in it.

Alternatively, run the following command:
```
kubectl run secret-1401 \
 -n admin1401 \
 --image=busybox \
 --dry-run=client \
 -o yaml \
 --command -- sleep 4800 \
 > admin.yaml
```
Add the secret volume and mount path to create a pod called secret-1401 in the admin1401 namespace as follows:
```
---
apiVersion: v1
kind: Pod
metadata:
  creationTimestamp: null
  labels:
    run: secret-1401
  name: secret-1401
  namespace: admin1401
spec:
  volumes:
  - name: secret-volume
    # secret volume
    secret:
      secretName: dotfile-secret
  containers:
  - command:
    - sleep
    - "4800"
    image: busybox
    name: secret-admin
    # volumes' mount path
    volumeMounts:
    - name: secret-volume
      readOnly: true
      mountPath: "/etc/secret-volume"
```
