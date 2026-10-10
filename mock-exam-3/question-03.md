Create a StorageClass named rancher-sc with the following specifications:

The provisioner should be rancher.io/local-path.
The volume binding mode should be WaitForFirstConsumer.
Volume expansion should be enabled.


- [ ] StorageClass rancher-sc is present
- [ ] Provisioner is rancher.io/local-path
- [ ] VolumeBindingMode is WaitForFirstConsumer