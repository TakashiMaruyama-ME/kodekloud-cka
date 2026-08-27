Scripts created for solution to https://learn.kodekloud.com/user/courses/cka-certification-course-certified-kubernetes-administrator/module/357c2670-c16c-49ac-aa27-8af52523afde/lesson/a4f095ef-ca2b-4cf9-9c6d-9c6739c3ca6e

Question 1:
1. Apply the necessary sysctl parameters for networking.
  * 1-sysctl.sh
1. Install kubeadm, kubelet 1.35.0-1.1 on both nodes
  * 2-install-all.sh
1. Install kubectl 1.35.0-1.1 on controlplane
  * 3-install-controlplane.sh

* kube-init.sh
* kube-config.sh
* kube-flannel.yml
  * replace "Network": "172.17.0.0/16"
  * add - --iface=eth0
