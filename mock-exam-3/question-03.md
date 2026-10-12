# Question
Create a StorageClass named rancher-sc with the following specifications:

The provisioner should be rancher.io/local-path.
The volume binding mode should be WaitForFirstConsumer.
Volume expansion should be enabled.


- [ ] StorageClass rancher-sc is present
- [ ] Provisioner is rancher.io/local-path
- [ ] VolumeBindingMode is WaitForFirstConsumer

# Solution
Use kubectl create storageclass and specify the required provisioner and parameters.

Create a manifest file rancher-sc.yaml:
```
apiVersion: storage.k8s.io/v1
kind: StorageClass
metadata:
  name: rancher-sc
provisioner: rancher.io/local-path
volumeBindingMode: WaitForFirstConsumer
allowVolumeExpansion: true
```
Apply the file on the cluster:
```
kubectl apply -f rancher-sc.yaml
```
To verify:
```
kubectl get storageclass rancher-sc -o yaml
```