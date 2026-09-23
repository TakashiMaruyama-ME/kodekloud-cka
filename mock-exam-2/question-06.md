# Question
From student-node `ssh cluster1-controlplane` to solve this question.

Create an `nginx` pod called `nginx-resolver` using the image `nginx` and expose it internally with a service called `nginx-resolver-service`. Test that you are able to look up the service and pod names from within the cluster. Use the image: `busybox:1.28` for dns lookup. Record results in `/root/CKA/nginx.svc` and `/root/CKA/nginx.pod`


- [ ] Pod: nginx-resolver created
- [ ] Service DNS Resolution recorded correctly
- [ ] Pod DNS resolution recorded correctly
# Solution