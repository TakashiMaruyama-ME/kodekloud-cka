# Question


From student-node ssh cluster2-controlplane to solve this question.


As a Kubernetes administrator, you are unable to run any of the kubectl commands on the cluster. Troubleshoot the problem and get the cluster to a functioning state.

# Solution
Check if the node's kubelet service is running. Without it, the control plane cannot register nodes or accept kubectl requests.

SSH into the control plane node:
ssh cluster2-controlplane

Preview system logs to check for issues:
journalctl -xe

Check the status of the kubelet service:
systemctl status kubelet

You should see that the kubelet service is inactive or failed.

Start the kubelet service:
sudo systemctl start kubelet

Enable the kubelet to start on boot (optional):
sudo systemctl enable kubelet

Confirm that kubectl is functional again:
kubectl get nodes