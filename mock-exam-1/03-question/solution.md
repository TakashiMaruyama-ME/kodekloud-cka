Solution
Use kubectl get crd to find all CRDs and filter by VerticalPodAutoscaler.

Remember to exit back to controlplane node before attempting this question.

To find the CRDs Related to VerticalPodAutoscaler, use the following kubectl command to list all CRDs and filter them for VerticalPodAutoscaler resources:

kubectl get crd -o custom-columns=NAME:.metadata.name | grep verticalpodautoscaler > /root/vpa-crds.txt

Ensure that the CRD names are correctly saved in the /root/vpa-crds.txt
The file should contain the CRD names related to VerticalPodAutoscaler.