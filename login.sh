#root for setup
#ssh -i ./ssh_keys/prod_key root@server_ip -p ssh_port
#then all subsequent
ssh -i ./ssh_keys/prod_key non_root_user@server_ip -p ssh_port

