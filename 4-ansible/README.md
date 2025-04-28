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
```
ansible-playbook -i inventory.ini -e ansible_user=ec2-user -e ansible_password=DevOps321 01-ping.yaml
```
![image](https://github.com/user-attachments/assets/9a5e688f-0a6a-4d6f-b7cc-1df04a54cf31)


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
```
ansible-playbook -i inventory.ini -e ansible_user=ec2-user -e ansible_password=DevOps321 02-nginx.yaml
```
![Screenshot 2025-04-28 082229](https://github.com/user-attachments/assets/c5b712ff-40a5-49c3-ae9f-86baaba077f4)


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
```
ansible-playbook -i inventory.ini -e ansible_user=ec2-user -e ansible_password=DevOps321 03-multi-play.yaml
```
![Screenshot 2025-04-28 082243](https://github.com/user-attachments/assets/8e442554-5669-488e-9d56-b028c13c37c7)


## 04-variables.yaml
```
- name: variables
  hosts: localhost
  vars:
    Course: DevOps
    Trainer: Siva
  tasks:
  - name: print info
    ansible.builtin.debug:
      msg: "Course is {{Course}} and Trainer is {{Trainer}}"
```
```
ansible-playbook -i inventory.ini -e ansible_user=ec2-user -e ansible_password=DevOps321 04-variables.yaml
```
![Screenshot 2025-04-28 093048](https://github.com/user-attachments/assets/d858def6-5d16-4261-908c-279f55097d12)

## 05-vars-task.yaml
```
- name: variables
  hosts: localhost
  vars:
    Course: DevOps
    Trainer: Siva
  tasks:
  - name: print override information
    vars: 
      Course: Ansible
    ansible.builtin.debug:
      msg: "Course is {{Course}} and Trainer is {{Trainer}}"
  - name: print information
    ansible.builtin.debug:
      msg: "Course is {{Course}} and Trainer is {{Trainer}}"  
```
```
ansible-playbook -i inventory.ini -e ansible_user=ec2-user -e ansible_password=DevOps321 05-vars-task.yaml
```
![Screenshot 2025-04-28 093111](https://github.com/user-attachments/assets/e5a1c70c-ceda-4564-92a6-3f05a715fef2)

## 06-vars-files.yaml
```
- name: variables from files
  hosts: localhost
  vars_files:
  - vars.yaml
  tasks:
  - name: print info
    ansible.builtin.debug:
      msg: "Course is {{Course}} and Trainer is {{Trainer}}"
```
```
ansible-playbook -i inventory.ini -e ansible_user=ec2-user -e ansible_password=DevOps321 06-vars-files.yaml
```
![Screenshot 2025-04-28 093136](https://github.com/user-attachments/assets/fc056ab0-8ca1-4bbe-bec3-b711ea64dd43)

## 07-vars-prompt.yaml
```
- name: variables from prompt
  hosts: localhost
  vars_prompt:
  - name: Username
    prompt: Enter your username
    private: false
  - name: Password
    prompt: Enter your password
    private: true
  tasks:
  - name: Login 
    ansible.builtin.debug:
     msg: "Username is {{Username}},Password is {{Password}}"
```
```
ansible-playbook -i inventory.ini -e ansible_user=ec2-user -e ansible_password=DevOps321 07-vars-prompt.yaml
```
![Screenshot 2025-04-28 093156](https://github.com/user-attachments/assets/8efb5c67-31e4-43cf-8a54-750b35db63fd)

## 08-vars-inventory.yaml
```
- name: variables from inventory
  hosts: localhost
  tasks:
  - name: print info
    ansible.builtin.debug:
      msg: "Course is {{Course}},Trainer is {{Trainer}},Duration is {{Duration}},Wishes is {{Wishes}}"
```
```
ansible-playbook -i inventory.ini -e ansible_user=ec2-user -e ansible_password=DevOps321 08-vars-inventory.yaml
```
![Screenshot 2025-04-28 093224](https://github.com/user-attachments/assets/f1608e74-8cde-44e0-82e3-7dba3c332e72)

## 09-vars-args.yaml
```
- name: variables from arguments
  hosts: localhost
  tasks:
  - name: print info
    ansible.builtin.debug:
      msg: "My name is {{name}}, I am from {{place}}"
```
```
ansible-playbook -i inventory.ini -e ansible_user=ec2-user -e ansible_password=DevOps321 09-vars-args.yaml -e name=sai -e place=amalapuram
```
![Screenshot 2025-04-28 093426](https://github.com/user-attachments/assets/cfde735a-e7ef-468c-9365-ba00f37d3540)

## 10-vars-preference.yaml
```
- name: variable preference
  hosts: localhost
  # vars:
  #  name : sai from playlevel
  # vars_prompt:
  # - name: name
  #   prompt: enter your name
  #   private: false
  vars_files:
  - vars.yaml
  tasks:
  - name: check preference
    # vars:
    #  name: sai from tasklevel
    ansible.builtin.debug:
      msg: "{{name}}"
# 1. arguments
# 2. Task level
# 3. variable files
# 4. Prompt
# 5. Play level
# 6. inventory
# 7. role level
```
```
ansible-playbook -i inventory.ini -e ansible_user=ec2-user -e ansible_password=DevOps321 10-vars-preference.yaml -e name=sai_from_arguments
```
![Screenshot 2025-04-28 100105](https://github.com/user-attachments/assets/83edd50d-8024-4277-a34e-4420b0512318)

```
ansible-playbook -i inventory.ini -e ansible_user=ec2-user -e ansible_password=DevOps321 10-vars-preference.yaml 
```
![Screenshot 2025-04-28 100230](https://github.com/user-attachments/assets/5a625e52-6f73-40ad-b289-cadfac3afea4)

Comment down the task level variable

```
ansible-playbook -i inventory.ini -e ansible_user=ec2-user -e ansible_password=DevOps321 10-vars-preference.yaml 
```
![Screenshot 2025-04-28 101119](https://github.com/user-attachments/assets/4b65c8b8-f842-4144-8eaa-07390d88a36a)

Comment down the variable present in variable file

```
ansible-playbook -i inventory.ini -e ansible_user=ec2-user -e ansible_password=DevOps321 10-vars-preference.yaml 
```
![Screenshot 2025-04-28 101214](https://github.com/user-attachments/assets/26d73c9d-d9a9-4dc9-acf9-ae00fe9a7c66)

Comment down the vars_prompt

```
ansible-playbook -i inventory.ini -e ansible_user=ec2-user -e ansible_password=DevOps321 10-vars-preference.yaml 
```
![Screenshot 2025-04-28 101336](https://github.com/user-attachments/assets/a243ece8-2123-40db-95ae-b3b2006bbcf2)

Comment down the play level variable

```
ansible-playbook -i inventory.ini -e ansible_user=ec2-user -e ansible_password=DevOps321 10-vars-preference.yaml 
```
![Screenshot 2025-04-28 101511](https://github.com/user-attachments/assets/64020377-cad1-4a87-bc7c-bfa5dbf2e131)

Comment down the inventory variable





