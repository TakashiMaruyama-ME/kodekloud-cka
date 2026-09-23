# Question


From student-node ssh cluster3-controlplane to solve this question.


Your cluster has a failed deployment named backend-api with multiple pods. Troubleshoot the deployment so that all pods are in a running state. Do not make adjustments to the resource limits defined on the deployment pods.

NOTE: A ResourceQuota named cpu-mem-quota is applied to the default namespace and should not be edited or modified.

# Solution
SSH into the cluster3-controlplane host
ssh cluster3-controlplane

1. Check Deployment Status
Verify the current status of the deployment:

kubectl get deploy

Expected output (shows that only 2 out of 3 pods are running):

NAME          READY   UP-TO-DATE   AVAILABLE   AGE
backend-api   2/3     2            2           3m48s

The third pod is not getting scheduled.

2. Find the Root Cause
Describe the ReplicaSet to check why the third pod is not being created:

kubectl describe replicasets backend-api-7977bfdbd5

The issue is due to ResourceQuota limitations.
The namespace has a memory limit of 300Mi, and the deployment is exceeding it.
requests.memory=128Mi, used: requests.memory=256Mi, limited: requests.memory=300Mi
Warning  FailedCreate  Error creating: pods "backend-api-7977bfdbd5-hpcjw" is forbidden: exceeded quota: cpu-mem-quota, 
requested: requests.memory=128Mi, used: requests.memory=256Mi, limited: requests.memory=300Mi

3, Modify the Deployment to Fit Within the ResourceQuota
Edit the deployment and reduce memory requests:

kubectl edit deployment backend-api -n default

Modify the resources section:

resources:
  requests:
    cpu: "50m"   # Reduced from 100m to 50m
    memory: "90Mi"   # Reduced from 128Mi to 90Mi (Fits within quota)
  limits:
    cpu: "150m"   
    memory: "150Mi"

4. Verify the Pods (Still Only 2 Running)
Check if the new pod is scheduled:

kubectl get pods -n default

If the third pod is still missing, the old ReplicaSet might be preventing it.

5. Delete the Old ReplicaSet to Allow New Pods to Start
Find the old ReplicaSet:

kubectl get rs -n default

Delete the outdated ReplicaSet:

kubectl delete rs backend-api-7977bfdbd5 -n default

Wait for the new pods to come up.

6. Confirm All Pods Are Running
kubectl get pods -n default