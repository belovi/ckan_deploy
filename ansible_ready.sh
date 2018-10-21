sudo apt-get update
sudo apt-get install -y software-properties-common
sudo apt-get install -y python-pip
sudo pip install --upgrade pip
sudo pip install ansible
cp /vagrant/{inventory,ckan2.yml} .
ansible-playbook ckan2.yml -i inventory -vv