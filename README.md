# ckan_deploy
Basic ansible playbook to deploy ckan instance
# File description
Vagrantfile - Parameters of vm host (Virtualbox)
ansible_ready - File for vagrant host provisioning, contains command that will install ansible on host and run playbook
ckan2.yml - ansible playbook to deploy ckan on selected host, it also will run jenkins container with first run
inventory - inventory file for playbook, contains host created by vagrant but can be modified
ckan_deploy.jenkinsfile - pipeline file for Jenkins, which runs ansible playbook with additional variables
# Requirements
You need to install Vagrant and VirtualBox:
https://www.vagrantup.com/
https://www.virtualbox.org/
# How to run
- Go to choosen directory n your host 
- Run vagrant init at this directory. Vagrant will create Vagrantfile in this directory (https://www.vagrantup.com/intro/getting-started/project_setup.html)
- Clone this repository in this directory replacing Vagrantfile 
- Run 'vagrant up' from this directory
- Wait for provisioning to end
- CKAN will be available at 127.0.0.1:5050, Jenkins will be available at 127.0.0.1:8080
# Next step: Jenkins setup
- You need to find vagrant private key and copy its content (key is located at .vagrant\machines\default\virtualbox\private_key in Vagrant init directory from the previous steps)
- Log in into Jenkins with administrator credentials (login:admin, password:admin)
- Go to "Credentials"
- Click on "vagrant" credentials, then "update"
- Paste contents of your private key into "Private Key" field, save changes
- Go to "Manage Jenkins" then "Manage Nodes", select "testlab" node
- Launch the node
- Now you can run "ckan_deploy" job 
# If something go wrong
- You can connect to "testlab" virtual machine under "vagrant" username using private key from vagrant init directory (.vagrant\machines\default\virtualbox\private_key) 
- To fix errors which can occur during provisioning process just run ansible playbook again:
  ansible-playbook ckan2.yml -i inventory -vv
  from vagrant home directory
