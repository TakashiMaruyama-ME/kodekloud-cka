A pod called np-test-1 and a service called np-test-service have been deployed in the default namespace. A default-deny NetworkPolicy is currently blocking all ingress traffic to pods in this namespace, which is why the service is unreachable.

Create a new NetworkPolicy named ingress-to-nptest in the default namespace that allows ingress traffic from all sources to the np-test-1 pod on port 80.


- [ ] Important: Don't delete any current objects deployed.
- [ ] Important: Don't Alter Existing Objects! (default-deny NetworkPolicy must still exist)
- [ ] NetworkPolicy: Is the port correct?
- [ ] NetworkPolicy: Is it applied to the correct Pod?
- [ ] Is ingress traffic to np-test-1 pod reachable on port 80? 