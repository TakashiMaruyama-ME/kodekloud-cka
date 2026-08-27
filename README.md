Scripts created for solution to https://learn.kodekloud.com/user/courses/cka-certification-course-certified-kubernetes-administrator/module/357c2670-c16c-49ac-aa27-8af52523afde/lesson/a4f095ef-ca2b-4cf9-9c6d-9c6739c3ca6e

Question 1:
1. Apply the necessary sysctl parameters for networking.
  * 1-sysctl.sh
2. Install kubectl 1.35.0-1.1 on controlplane
  * 2-install-controlplane.sh
3. Install kubeadm, kubelet 1.35.0-1.1 on both nodes
  * 3-install-node.sh


Question 5:
1. Initialize Control Plane Node (Master Node)
  * 4-init-master.sh
2. set up the default kubeconfig file 
  * 5-default-kubeconfig.sh

Question 8:
1. install a network plugin, Flannel
  * 6-download-flannel-yml.sh
  * custom-flannel-config.yml
    * replace "Network": "172.17.0.0/16"
    * add - --iface=eth0
