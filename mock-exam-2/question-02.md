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
3) Both containers must share the same `emptyDir` volume mounted at `/var/log/app`.

4) Use any consistent label for the Deployment selector and the Pod template labels (the exact key/value is up to you, as long as they match).

`log-agent` logs should display the entries logged by the main `app-container`.


- [ ] Co-located container displays logs from main container (with rollout wait + retry)
- [ ] Deployment defines both containers correctly (label-agnostic)
- [ ] Both containers mount volume at /var/log/app
- [ ] Volume type is emptyDir and both containers mount the SAME volume name

# Solution
Create the Deployment YAML file, for example logger-deployment.yaml :
```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: logging-deployment
  namespace: logging-ns
spec:
  replicas: 1
  selector:
    matchLabels:
      app: logger
  template:
    metadata:
      labels:
        app: logger
    spec:
      volumes:
        - name: log-volume
          emptyDir: {}
      containers:
        - name: app-container
          image: busybox
          command: ["sh", "-c", "mkdir -p /var/log/app; while true; do echo 'Log entry' >> /var/log/app/app.log; sleep 5; done"]
          volumeMounts:
            - name: log-volume
              mountPath: /var/log/app
        - name: log-agent
          image: busybox
          command: ["sh", "-c", "touch /var/log/app/app.log; tail -f /var/log/app/app.log"]
          volumeMounts:
            - name: log-volume
              mountPath: /var/log/app
```

Apply the deployment:
```
kubectl apply -f logger-deployment.yaml
```

Verify that the log-agent container displays log entries:
```
kubectl logs -n logging-ns deployment/logging-deployment -c log-agent --tail=50
```

You should see repeated Log entry lines in the output.

# My Solution
Start with a basic `deployment` created from imperative command:
```
kubectl create deploy logging-deployment -n logging-ns --image=busybox --dry-run=client -o yaml > logging.yaml
```
Then edit the file to include, the 2nd pod, and shared volume.
```
apiVersion: apps/v1
kind: Deployment
metadata:
  labels:
    app: logging-deployment
  name: logging-deployment
  namespace: logging-ns
spec:
  replicas: 1
  selector:
    matchLabels:
      app: logging-deployment
  template:
    metadata:
      labels:
        app: logging-deployment
    spec:
      volumes:
        - name: shared-volume
          emptyDir: {}
      containers:
        - name: app-container
          image: busybox
          command: ["sh","-c"]
          args:
            - |
              mkdir -p /var/log/app
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
```