# Question
Create a `Persistent Volume` with the given specification: -

Volume name: `pv-analytics`  
Storage: `100Mi`  
Access mode: `ReadWriteMany`  
Host path: `/pv/data-analytics`  

- [ ] Is the volume name set?
- [ ] Is the storage capacity set?
- [ ] Is the accessMode set?
- [ ] Is the hostPath set?

# Solution
Solution manifest file to create a persistent volume pv-analytics as follows:
```
---
apiVersion: v1
kind: PersistentVolume
metadata:
  name: pv-analytics
spec:
  capacity:
    storage: 100Mi
  volumeMode: Filesystem
  accessModes:
    - ReadWriteMany
  hostPath:
      path: /pv/data-analytics
```
