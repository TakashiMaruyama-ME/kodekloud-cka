# Question
While preparing to install a CNI plugin on your Kubernetes cluster, you typically need to confirm the cluster-wide Pod network CIDR. Identify the Pod subnet configured for the cluster (the value specified under podSubnet in the kubeadm configuration). Output this CIDR in the format x.x.x.x/x to a file located at /root/pod-cidr.txt.


Note: Use the cluster-wide podSubnet from the kubeadm-config ConfigMap, not the per-node CIDR from kubectl get node.

- [ ] Is the cluster-wide Pod CIDR network correctly written to the file?

# Solution
Look for the podSubnet value in the kubeadm-config ConfigMap in the kube-system namespace: kubectl -n kube-system get configmap kubeadm-config -o yaml | grep podSubnet. Important: This cluster-wide CIDR (e.g., /16) is different from the per-node CIDR shown by kubectl get node -o jsonpath='{.spec.podCIDR}' (e.g., /24).

To identify the cluster-wide Pod subnet, inspect the kubeadm-config ConfigMap, which contains the ClusterConfiguration used during kubeadm init:
```
kubectl -n kube-system get configmap kubeadm-config -o yaml | grep podSubnet
# podSubnet: 172.17.0.0/16
```
Save just the CIDR value to /root/pod-cidr.txt:
```
kubectl -n kube-system get configmap kubeadm-config -o yaml \
  | awk '/podSubnet:/{print $2}' > /root/pod-cidr.txt
```
Verify:
```
cat /root/pod-cidr.txt
# 172.17.0.0/16
```
Note:

Be careful not to confuse Cluster PodCIDR vs Node PodCIDR:

* Cluster = Entire pool
  Cluster PodCIDR (big range: 172.17.0.0/16)
  Find it with : kubectl get cm kubeadm-config -n kube-system -o yaml

* Node = Single slice
  Node PodCIDR (small slice: 172.17.0.0/24)
  Find it with : kubectl get node <name> -o jsonpath='{.spec.podCIDR}'
