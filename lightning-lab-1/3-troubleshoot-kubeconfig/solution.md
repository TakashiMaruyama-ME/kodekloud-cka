Solution
Make sure the port for the kube-apiserver is correct. So for this change port from 4380 to 6443.

Run the below command to know the cluster information:

kubectl cluster-info --kubeconfig /root/CKA/admin.kubeconfig