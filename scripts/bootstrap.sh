#provision script - install ansible deps - pre-reqs - install ansible - call anisble playbook.
apt-get install -y python-software-properties
apt-add-repository -y ppa:ansible/ansible
apt-get update
sudo apt-get install -y ansible git pastebinit
#nasty copy of ansible_hosts because vagrant share was forcing execute permissions and ansible didn't like it.
sudo cp /vagrant/templates/ansible_hosts /etc/ansible_hosts; chmod 0644 /etc/ansible_hosts
sudo ansible-playbook -i /etc/ansible_hosts -c "local" /vagrant/ansible/playbooks/vanilla-nginx.yml
