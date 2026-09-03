Solution
Run the command: kubectl expose deployment hr-web-app --type=NodePort --port=8080 --name=hr-web-app-service --dry-run=client -o yaml > hr-web-app-service.yaml to generate a service definition file.

Now, in generated service definition file add the nodePort field with the given port number under the ports section and create a service.