# ASGI webapp deployment

Code is heavily based on the excellent book:

The Full Stack Python Guide to Deployments

[Full Stack Python Guide to Deployments](http://www.deploypython.com/)
book. (https://gumroad.com/l/WOvyt).

Modified to use:

Python 3 (3.7)
Ansible 2 (2.9)
ASGI server 
MongoDB 
(see playbook in original book for PostgreSQL)

## Process:

Setup VPS (eg AWS/Digitalocean/Linode)

#### Setup keys:

mkdir -p fsp/ssh_keys
cd fsp/ssh_keys
ssh-keygen -t rsa -b 2048
######use ./prod_key
cp prod_key.pub authorized_keys

#### add firewall rule to allow traffic to server

#### login + update
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install fail2ban

#####change ssh port + password settings
sudo nano /etc/ssh/sshd_config


#####groupadd deployers - see 'full stack python guide to deployments' book page 35

#####copy keys to server see 'full stack python guide to deployments' book page 37
scp -P port_num prod_key.pub authorized_keys deployer@server_ip:~/.ssh
service ssh reload

#### Playbooks

setup varibales in prod/group_vars/all.yml

run ./deploy_prod.sh