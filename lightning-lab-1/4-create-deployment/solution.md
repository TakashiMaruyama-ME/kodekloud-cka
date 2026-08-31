Solution
Deployment Creation and Update with Annotation
Follow these steps to create a deployment, update its image, and record the change using annotations.

Step 1: Create the Deployment
Use the kubectl create command to create a deployment named nginx-deploy with the nginx:1.16 image.

kubectl create deployment nginx-deploy --image=nginx:1.16

Step 2: Update the Deployment Image
Update the nginx-deploy deployment to use the nginx:1.17 image.

kubectl set image deployment/nginx-deploy nginx=nginx:1.17

Step 3: Annotate the Deployment to Record the Change
Manually annotate the deployment to log the change, replacing the functionality of the deprecated --record option.

kubectl annotate deployment nginx-deploy kubernetes.io/change-cause="Updated nginx image to 1.17"

This annotation acts as a record of the image update.