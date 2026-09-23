# Question
From student-node `ssh cluster1-controlplane` to solve this question.

Create a deployment named `logging-deployment` in the namespace `logging-ns` with 1 replica, with the following specifications:

1) The main container must be named `app-container`, use the image `busybox`, and start by creating a log directory `/var/log/app` and run the below command to simulate generating logs:

```
while true; do 
  echo "Log entry" >> /var/log/app/app.log
  sleep 5
done
```

2) Add a co-located container named `log-agent` that also uses the `busybox` image and runs these commands:
```
touch /var/log/app/app.log
tail -f /var/log/app/app.log
```
3) Both containers must share the same `emptyDir``volume mounted at `/var/log/app`.

4) Use any consistent label for the Deployment selector and the Pod template labels (the exact key/value is up to you, as long as they match).

`log-agent` logs should display the entries logged by the main `app-container`.


- [ ] Co-located container displays logs from main container (with rollout wait + retry)
- [ ] Deployment defines both containers correctly (label-agnostic)
- [ ] Both containers mount volume at /var/log/app
- [ ] Volume type is emptyDir and both containers mount the SAME volume name



# Solution
```
k create deploy logging-deployment -n logging-ns --image=busybox -o yaml > logging.yaml
```
```
apiVersion: apps/v1
kind: Deployment
metadata:
  creationTimestamp: "2026-09-23T19:35:19Z"
  generation: 1
  labels:
    app: logging-deployment
  name: logging-deployment
  namespace: logging-ns
  resourceVersion: "6684"
  uid: 3faea220-f188-442d-9f03-4243b4ac03b4
spec:
  progressDeadlineSeconds: 600
  replicas: 1
  revisionHistoryLimit: 10
  selector:
    matchLabels:
      app: logging-deployment
  strategy:
    rollingUpdate:
      maxSurge: 25%
      maxUnavailable: 25%
    type: RollingUpdate
  template:
    metadata:
      labels:
        app: logging-deployment
    spec:
      containers:
      - name: app-container
        image: busybox
        command: ["sh","-c"]
        args: 
          - |
            while true; do
              echo "Log entry" >> /var/log/app/app.log
              sleep 5
            done
        volumeMounts:
          - name: shared-volume
            mountPath: /var/log/app
      - name: log-agent
        image: busybox
        command: ["sh","-c"]
        args: 
          - |
            touch /var/log/app/app.log
            tail -f /var/log/app/app.log
        volumeMounts:
          - name: shared-volume
            mountPath: /var/log/app
      volumes:
        - name: shared-volume
          emptyDir: {}

      dnsPolicy: ClusterFirst
      restartPolicy: Always
      schedulerName: default-scheduler
```