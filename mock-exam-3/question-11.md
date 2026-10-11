Create a Horizontal Pod Autoscaler (HPA) api-hpa for the deployment named api-deployment located in the api namespace.
The HPA should scale the deployment based on a custom metric named requests_per_second, targeting an average value of 1000 requests per second across all pods.
Set the minimum number of replicas to 1 and the maximum to 20.

Note: Deployment named api-deployment is available in api namespace. Ignore errors due to the metric requests_per_second not being tracked in metrics-server


- [ ] Is api-hpa HPA deployed in api namespace?
- [ ] Is api-hpa configured for metric requests_per_second?