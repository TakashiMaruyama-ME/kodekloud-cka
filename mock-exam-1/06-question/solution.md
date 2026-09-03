Solution
To know more details of orange pod:

kubectl describe po orange

and look under the initContainers section. There is an issue with the given command.


 Command:
      sh
      -c
      sleeeep 2;



In the above, we need to correct the sleeeep command.

To update the pod with an easiest way by running command:

kubectl edit po orange

It's not possible to update the changes in the running pod so after saving the changes. It will create a temporary file in the default location /tmp/.

Use that manifest file and replace with the existing pod:

kubectl replace -f /tmp/kubectl-edit-xxxx.yaml --force

Above command will delete the existing pod and will recreate the new pod with latest changes.