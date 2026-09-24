# Question
From student-node `ssh cluster1-controlplane` to solve this question.

Create a StorageClass named `local-sc` with the following specifications and set it as the default storage class:

  * The provisioner should be kubernetes.io/no-provisioner
  * The volume binding mode should be WaitForFirstConsumer
  * Volume expansion should be enabled

- [ ] Is the StorageClass local-sc created?
- [ ] Is Provisioner kubernetes.io/no-provisioner used?
- [ ] Is the volume binding set to WaitForFirstConsumer?
- [ ] Is local-sc set to the default storage class?

# Solution
Check kubernetes.io documentation on StorageClasses

On cluster1-controlplane:

Create the StorageClass YAML file:
```
# local-sc.yaml
apiVersion: storage.k8s.io/v1
kind: StorageClass
metadata:
  name: local-sc
  annotations:
    storageclass.kubernetes.io/is-default-class: "true"
provisioner: kubernetes.io/no-provisioner
volumeBindingMode: WaitForFirstConsumer
allowVolumeExpansion: true
```

Apply the manifest on the specified cluster:
```
ssh cluster1-controlplane
kubectl apply -f local-sc.yaml
```

Verify the StorageClass
```
kubectl get storageclass
```

You should see local-sc marked as (default) with the correct provisioner and settings

# My Solution
https://kubernetes.io/docs/concepts/storage/storage-classes/

```
apiVersion: storage.k8s.io/v1
kind: StorageClass
metadata:
  name: local-sc
  annotations:
    storageclass.kubernetes.io/is-default-class: "true"
provisioner: kubernetes.io/no-provisioner
reclaimPolicy: Retain # default value is Delete
allowVolumeExpansion: true
mountOptions:
  - discard # this might enable UNMAP / TRIM at the block storage layer
volumeBindingMode: WaitForFirstConsumer
parameters:
  guaranteedReadWriteLatency: "true" # provider-specific

```