# Question
A pod called np-test-1 and a service called np-test-service have been deployed in the default namespace. A default-deny NetworkPolicy is currently blocking all ingress traffic to pods in this namespace, which is why the service is unreachable.

Create a new NetworkPolicy named ingress-to-nptest in the default namespace that allows ingress traffic from all sources to the np-test-1 pod on port 80.


- [ ] Important: Don't delete any current objects deployed.
- [ ] Important: Don't Alter Existing Objects! (default-deny NetworkPolicy must still exist)
- [ ] NetworkPolicy: Is the port correct?
- [ ] NetworkPolicy: Is it applied to the correct Pod?
- [ ] Is ingress traffic to np-test-1 pod reachable on port 80? 

# Solution
A default-deny NetworkPolicy is already in place blocking all ingress traffic. You need to create a second NetworkPolicy that explicitly allows ingress to the np-test-1 pod on port 80 from any source.

  1. Inspect the existing default-deny policy to understand the current state:
```
kubectl get netpol -n default
kubectl describe netpol default-deny
```

  2. Create a manifest file ingress-to-nptest.yaml:
```
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: ingress-to-nptest
  namespace: default
spec:
  podSelector:
    matchLabels:
      run: np-test-1
  policyTypes:
  - Ingress
  ingress:
  - ports:
    - protocol: TCP
      port: 80
```
Leaving the from: field empty under ingress means traffic is allowed from all sources.

  3. Apply the policy:
```
kubectl apply -f ingress-to-nptest.yaml
```

  4. Verify traffic is now allowed:
```
kubectl run test-conn --image=busybox --restart=Never --rm -it -- wget -qO- -T 5 http://np-test-service
```
You should see the nginx welcome page in the output.

Solution manifest file to create a network policy ingress-to-nptest as follows:
```
---
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: ingress-to-nptest
  namespace: default
spec:
  podSelector:
    matchLabels:
      run: np-test-1
  policyTypes:
  - Ingress
  ingress:
  - ports:
    - protocol: TCP
      port: 80```