# Question
From student-node `ssh cluster1-controlplane` to solve this question.


Create a new user called `john`. Grant him access to the cluster using a csr named `john-developer`. Create a role `developer` which should grant John the permission to `create, list, get, update and delete` pods in the `development` namespace . The private key exists in the location: `/root/CKA/john.key` and csr at `/root/CKA/john.csr`.


`Important Note:` As of kubernetes 1.19, the CertificateSigningRequest object expects a `signerName`.

Please refer to the documentation to see an example. The documentation tab is available at the top right of the terminal.

- [ ] CSR: john-developer Status:Approved
- [ ] Role Name: developer, namespace: development, Resource: Pods
- [ ] Access: User 'john' has appropriate permissions

# Solution