xargs apt install -y < requirements.txt

HOST=$(netstat -nr | awk 'FNR==4{ print $0}' | awk '{ print $1}')

sed "s/to_change/$HOST/g" hosts_template.yml > hosts.yml

ansible-playbook windows.yml -i hosts.yml
