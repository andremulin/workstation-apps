HOST=$(netstat -nr | awk 'FNR==3{ print $0}' | awk '{ print $2}')

sed "s/to_change/$HOST/g" hosts_template.yml > hosts.yml

ansible-playbook windows.yml -i hosts.yml