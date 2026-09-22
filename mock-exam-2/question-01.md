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
https://kubernetes.io/docs/concepts/storage/storage-classes/