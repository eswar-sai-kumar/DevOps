
# Ansible

## How to run ansible through EC2 instances ?


#### Create EC2 instance(proceed without key pairs, choose default security group) and copy public IP address and paste it in superputty
![image](https://github.com/user-attachments/assets/e06f9098-4b25-4d27-bdbb-fa54d4a14fc6)


#### Enter password "DevOps321" (AMI used in EC2 is RHEL-9-DevOps-Practice  AMI ID: ami-09c813fb71547fc4f)
![image](https://github.com/user-attachments/assets/dd25ffb4-dd85-4a5b-863c-0a3e2d33ff3f)

#### Install Ansible
```
sudo dnf install ansible -y
```

#### Install Git
```
sudo dnf install git -y
```

#### Clone Repository
```
git clone "https://github.com/eswar-sai-kumar/DevOps.git"
```

#### Change directory to where ansible file located
```
cd DevOps/4-ansible
```

#### Run ansible file ? 
```
ansible-playbook -i inventory.ini -e ansible_user=ec2-user -e ansible_password=DevOps321 example.yaml
```

1. 01-ping.yaml
   ```
   - name: pinging the server
     hosts: web
     tasks:
       - name: pinging the server
         ansible.builtin.ping:
   ```
