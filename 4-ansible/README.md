
# Ansible

How to run ansible through EC2 instances ?
Create EC2 instance

```
ansible playbook -i inventory.ini -e ansible_user=ec2-user -e ansible_password=DevOps321 example.yaml
```

1. 01-ping.yaml
   ```
   - name: pinging the server
     hosts: web
     tasks:
       - name: pinging the server
         ansible.builtin.ping:
   ```
