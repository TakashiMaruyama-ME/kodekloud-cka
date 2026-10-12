# Question
We have created a new deployment called nginx-deploy. Scale the deployment to 3 replicas. Has the number of replicas increased? Troubleshoot and fix the issue.


- [ ] Does the deployment have 3 replicas?

# Solution
Use the command kubectl scale to increase the replica count to 3.
```
kubectl scale deploy nginx-deploy --replicas=3
```
The controller-manager is responsible for scaling up pods of a replicaset. If you inspect the control plane components in the kube-system namespace, you will see that the controller-manager is not running.
```
kubectl get pods -n kube-system
```
The command (binary name) running inside the controller-manager pod has a typo — the letter l has been replaced with the numeral 1 in kube-contro1ler-manager.

Fix the binary name in the manifest file:
```
sed -i 's/kube-contro1ler-manager/kube-controller-manager/g' /etc/kubernetes/manifests/kube-controller-manager.yaml
```
The kubelet detects the change automatically and restarts the pod within ~20 seconds. Wait for the kube-controller-manager pod to show as Running:
```
kubectl get pods -n kube-system | grep controller-manager
```
Once the controller-manager is running, the deployment scale will take effect. Verify with:
```
kubectl get deploy
NAME           READY   UP-TO-DATE   AVAILABLE   AGE
nginx-deploy   3/3     3            3           6m2s
```