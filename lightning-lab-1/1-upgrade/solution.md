# Task
Upgrade the current version of kubernetes from 1.34.0 to 1.35.0 exactly using the kubeadm utility. Make sure that the upgrade is carried out one node at a time starting with the controlplane node. To minimize downtime, the deployment gold-nginx should be rescheduled on an alternate node before upgrading each node.

Upgrade controlplane node first and drain node node01 before upgrading it. Pods for gold-nginx should run on the controlplane node subsequently.

  * Cluster Upgraded?
  * pods 'gold-nginx' running on controlplane?

# Solution
## upgrade controlplane
Drain
Update apt
Upgrade kubeadm
Uncordon

### Step 1: drain controlplane
  ```
  kubectl drain controlplane --ignore-daemonsets
  ```

### Step 2: Update apt source
On the controlplane node:
Use any text editor you prefer to open the file that defines the Kubernetes apt repository.
  ```
  vim /etc/apt/sources.list.d/kubernetes.list
  ```

Update the version in the URL to the next available minor release, i.e v1.35.
  ```
  deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.35/deb/ /
  ```

After making changes, save the file and exit from your text editor. Proceed with the next instruction.
  ```  
  apt update
  apt-cache madison kubeadm 
  apt-get install kubeadm=1.35.0-1.1
  ```

### Step 3: upgrade kubeadm
Run the following command to upgrade the Kubernetes cluster.
  ```
  kubeadm upgrade plan v1.35.0
  kubeadm upgrade apply v1.35.0
  ```

Now, upgrade the version and restart Kubelet. Also, mark the node (in this case, the "controlplane" node) as schedulable.
  ```
  apt-get install kubelet=1.35.0-1.1
  systemctl daemon-reload
  systemctl restart kubelet
  ```

### Step 4: uncordon
  ```
  kubectl uncordon controlplane
  ```

## IF controlplane gets a taint
Before draining node01, if the controlplane gets taint during an upgrade, we have to remove it.

Identify the taint first. 
  ```
  kubectl describe node controlplane | grep -i taint
  ```

Remove the taint with help of "kubectl taint" command.
  ```
  kubectl taint node controlplane node-role.kubernetes.io/control-plane:NoSchedule-
  ```

Verify it, the taint has been removed successfully.  
  ```
  kubectl describe node controlplane | grep -i taint
  ```
## Upgrade nodes
Drain node
Update apt
Upgrade kubeadm

### Step 1: drain node01
Now, drain the node01 as follows: -
  ```
  kubectl drain node01 --ignore-daemonsets
  ```

### Step 2: update apt on node01
SSH to the node01 and perform the below steps as follows: -

Use any text editor you prefer to open the file that defines the Kubernetes apt repository.
  ```
  vim /etc/apt/sources.list.d/kubernetes.list
  ```

Update the version in the URL to the next available minor release, i.e v1.35.
  ```
  deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.35/deb/ /
  ```

After making changes, save the file and exit from your text editor. Proceed with the next instruction.
  ```
  apt update
  apt-cache madison kubeadm
  ```

### Step 3: upgrade node
Based on the version information displayed by apt-cache madison, it indicates that for Kubernetes version 1.35.0, the available package version is 1.35.0-1.1. Therefore, to install kubeadm for Kubernetes v1.35.0, use the following command:
  ```
  apt-get install kubeadm=1.35.0-1.1
  # Upgrade the node 
  kubeadm upgrade node
  ```

Now, upgrade the version and restart Kubelet.
  ```
  apt-get install kubelet=1.35.0-1.1
  systemctl daemon-reload
  systemctl restart kubelet
  ```

### Step 4: uncordon node01
To exit from the specific node, type exit or logout on the terminal.

Back on the controlplane node: -
  ```
  kubectl uncordon node01
  kubectl get pods -o wide | grep gold # make sure this is scheduled on a node
  ```
