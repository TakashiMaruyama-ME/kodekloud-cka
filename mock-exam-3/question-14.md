While preparing to install a CNI plugin on your Kubernetes cluster, you typically need to confirm the cluster-wide Pod network CIDR. Identify the Pod subnet configured for the cluster (the value specified under podSubnet in the kubeadm configuration). Output this CIDR in the format x.x.x.x/x to a file located at /root/pod-cidr.txt.


Note: Use the cluster-wide podSubnet from the kubeadm-config ConfigMap, not the per-node CIDR from kubectl get node.

- [ ] Is the cluster-wide Pod CIDR network correctly written to the file?