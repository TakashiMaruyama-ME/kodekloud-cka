Solution
In this task, we will use the kubectl and helm commands. Here are the steps: -



use the helm ls command to list all the releases installed using Helm in the Kubernetes cluster.

helm ls -A



Here -A or --all-namespaces option lists all the releases of all the namespaces.



Identify the namespace where the resources get deployed.


Use the helm repo ls command to list the helm repositories.
helm repo ls 



Now, update the helm repository with the following command: -

helm repo update kk-mock1 -n kk-ns



The above command updates the local cache of available charts from the configured chart repositories.



The helm search command searches for all the available charts in a specific Helm chart repository. In our case, it's the podinfo helm chart.
helm search repo kk-mock1/podinfo -n kk-ns -l | head -n30



The -l or --versions option is used to display information about all available chart versions.



Upgrade the helm chart to 6.11.2: -

helm upgrade kk-mock1 kk-mock1/podinfo -n kk-ns --version=6.11.2



After upgrading the chart version, you can verify it with the following command: -

helm ls -n kk-ns



Look under the CHART column for the chart version.