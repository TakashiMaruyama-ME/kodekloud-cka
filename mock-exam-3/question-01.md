# Question
You are an administrator preparing your environment to deploy a Kubernetes cluster using kubeadm. Adjust the following network parameters on the system to the following values, and make sure your changes persist reboots:

net.ipv4.ip_forward = 1   
net.bridge.bridge-nf-call-iptables = 1   


- [ ] net.ipv4.ip_forward is set to 1
- [ ] net.bridge.bridge-nf-call-iptables is set to 1

# Solution
Use sysctl to adjust system parameters and make sure they persist across reboots.

To set the required sysctl parameters and make them persistent:
```
echo 'net.ipv4.ip_forward = 1' >> /etc/sysctl.conf
echo 'net.bridge.bridge-nf-call-iptables = 1' >> /etc/sysctl.conf
sysctl -p
```

To verify:
```
sysctl net.ipv4.ip_forward
sysctl net.bridge.bridge-nf-call-iptables
```