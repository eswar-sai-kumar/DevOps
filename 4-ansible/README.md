
# Ansible

## How to run ansible through EC2 instances ?


#### Create EC2 instance(proceed without key pairs, choose allow-everything security group) and copy public IP address and paste it in superputty
![image](https://github.com/user-attachments/assets/e06f9098-4b25-4d27-bdbb-fa54d4a14fc6)


#### Enter password "DevOps321" (AMI used in EC2 is RHEL-9-DevOps-Practice  AMI ID: ami-09c813fb71547fc4f)
![image](https://github.com/user-attachments/assets/dd25ffb4-dd85-4a5b-863c-0a3e2d33ff3f)

#### If superputty not works properly use git bash, To use gitbash EC2 instance should have key pair
![image](https://github.com/user-attachments/assets/e9d4f601-2fd9-4b57-982b-0a1ea187b9f1)

```
ssh -i daws.pem ec2-user@3.85.221.230
```
daws.pem is private key
After running command, Enter password "DevOps321"

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

## 01-ping.yaml
```
- name: pinging the server 
  hosts: web
  tasks:
  - name: pinging the server
    ansible.builtin.ping:
```

## 02-nginx.yaml
```
- name: install and run nginx
  hosts: web
  become: yes # equal to -b in adhoc commands, getting root access
  tasks:
  - name: install nginx
    ansible.builtin.dnf:
      name: nginx
      state: latest
  - name: start nginx
    ansible.builtin.service:
      name: nginx
      state: started
      enabled: yes
```

## 03-multi-play.yaml
```
- name: PLAY-1
  hosts: localhost
  tasks:
  - name: PLAY-1 and TASK-1
    ansible.builtin.debug:
      msg: "Hello I am from PLAY-1 and TASK-1"

- name: PLAY-2
  hosts: localhost
  tasks:
  - name: PLAY-2 and TASK-1
    ansible.builtin.debug:
      msg: "Hello I am from PLAY-2 and TASK-1"
```
