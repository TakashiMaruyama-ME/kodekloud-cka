# Solution
Use dpkg to install the package and systemctl to manage the service.

SSH to node01 as follows, using password caleston123:
```
ssh bob@node01
```
Switch to root using sudo -i or prefix the commands below using sudo.

The cri-docker_0.3.16.3-0.debian.deb package is located in the /root directory. Use dpkg to install the package:
```
dpkg -i /root/cri-docker_0.3.16.3-0.debian.deb
```

After installing the package, start the cri-docker service and enable it to start on boot:
```
systemctl start cri-docker
systemctl enable cri-docker
```
Verify that the cri-docker service is running:
```
systemctl is-active cri-docker
```
Check that it is enabled to start on boot:
```
systemctl is-enabled cri-docker
```
You should see active and enabled as the output for both commands