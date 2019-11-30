#/bin/bash

# create kubecfg user
sudo useradd -m kubecfg

# create ssh directory
sudo mkdir -p /home/kubecfg/.ssh

# copy keys to .ssh directory
sudo cp /vagrant/keys/* /home/kubecfg/.ssh/

# make kubecfg authorized by the same key
sudo cp /home/kubecfg/.ssh/id_rsa.pub /home/kubecfg/.ssh/authorized_keys

# Change ownership
sudo chown -R kubecfg. /home/kubecfg/.ssh/

# Change permissions
sudo chmod 700 /home/kubecfg/.ssh/
sudo chmod 600 /home/kubecfg/.ssh/id_rsa
sudo chmod 644 /home/kubecfg/.ssh/id_rsa.pub
sudo chmod 700 /home/kubecfg/.ssh/authorized_keys

# Make kubecfg sudoer
echo "kubecfg ALL=(ALL)	NOPASSWD: ALL" | sudo tee -a /etc/sudoers.d/kubecfg

# install ansible
sudo apt-add-repository ppa:ansible/ansible
sudo apt-get update
sudo apt-get install ansible -y

# run ansible playbook as kubecfg user
sudo su - kubecfg -c "cd /vagrant/k3sdeploy;ansible-playbook main.yaml"
