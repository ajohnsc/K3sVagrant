# How to use the 

1. Install VirtualBox
2. Install Vagrant
3. Clone repository
```
git clone https://github.com/ajohnsc/K3sVagrant.git
```
4. then start the VMs
```
cd K3sVagrant
vagrant up
```
5. After provisioning check nodes if all is present
```
vagrant ssh master
sudo kubectl get nodes
```

### there you have it a K3s cluster using vagrant
