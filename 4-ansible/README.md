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

#### Paste private IP in inventory.ini
## inventory.ini
```
[web]
172.31.91.204
```

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
#### Don't forget to pull after pushing into github
```
git pull
```
#### Run ansible file 
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
![image](https://github.com/user-attachments/assets/20f1c1db-2bdf-4ed0-b5da-80841d45a879)


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

## 11-data-types.yaml
```
- name: datatypes
  hosts: web
  vars:
    Course: DevOps with AWS
    Tools: # list
    - Linux
    - Shell
    - Ansible
    Experience:
      DevOps: 3
      AWS: 2
      Docker: 1
    RealProject: True
  tasks:
  - name: print info
    ansible.builtin.debug:
      msg: "Course is {{Course}},Tools covered {{Tools}}, is RealProject is {{RealProject}}"
```
```
ansible-playbook -i inventory.ini -e ansible_user=ec2-user -e ansible_password=DevOps321 11-data-types.yaml 
```
![Screenshot 2025-04-28 145239](https://github.com/user-attachments/assets/3b61b5d5-f65b-4caf-86f2-244f3b32262c)

## 12-conditions.yaml
```
- name: conditions
  hosts: web
  become: yes
  tasks:
  - name: check user exists or not
    ansible.builtin.command: id expense
    register: user
    ignore_errors: true
  - name: print user info
    ansible.builtin.debug:
      msg: "User info is {{user}}"
  - name: create user
    ansible.builtin.command: useradd expense
    when: user.rc != 0  # condition (rc means return count)
    # if user.rc == 0 (user expense already exists)
    # if user.rc !=0 (user expense not exists)
  - name: say hello
    ansible.builtin.debug:
      msg: "Hello"
```
```
ansible-playbook -i inventory.ini -e ansible_user=ec2-user -e ansible_password=DevOps321 12-conditions.yaml 
```
![Screenshot 2025-04-28 150344](https://github.com/user-attachments/assets/1649d565-57cd-45b7-9d16-ad9e3b0a350e)

## 13-conditions.yaml
```
- name: check number 
  hosts: localhost
  vars_prompt:
  - name: number
    prompt: Enter the number
    private: no
  tasks:
  - name: number is less than 100
    ansible.builtin.debug:
      msg: "Given number {{number}} is less than 100"
    when: number | int < 100
  - name: number is greater than 100
    ansible.builtin.debug:
      msg: "Given number {{number}} is greater than 100"
    when: number | int > 100
```
```
ansible-playbook -i inventory.ini -e ansible_user=ec2-user -e ansible_password=DevOps321 13-conditions.yaml 
```
![Screenshot 2025-04-28 151045](https://github.com/user-attachments/assets/1c666779-5cce-4237-96bb-dad5f2157ebf)

## 14-filters.yaml
```
- name: default value
  hosts: localhost
  tasks:
  - name: print info
    ansible.builtin.debug:
      msg: "Hello {{Course | default('ansible')}}"

- name: upper case and lower case
  hosts: localhost
  vars:
    greeting: "Hello good morning"
    trainer: "siva"
  tasks:
  - name: print info
    ansible.builtin.debug:
      msg: "{{ greeting | upper}},{{ trainer | lower }}"

- name: remove duplicates,min and max
  hosts: localhost
  vars:
    numbers: [1,2,3,4,5,2,2,4]
  tasks:
  - name: remove duplicates
    ansible.builtin.debug:
      msg: "Removed duplicates {{ numbers | unique }}"
  - name: min and max
    ansible.builtin.debug:
      msg: "Min is{{numbers | min}},Max is {{numbers | max}}"

- name: convert list/items to dict
  hosts: localhost
  vars:
    my_list:
    - {key: 'course',value: 'ansible'}
    - {key: 'trainer',value: 'sivakumar'}
    - {key: 'duration',value: '120 hrs'}
  tasks:
  - name: before convert
    ansible.builtin.debug:
      msg: "{{my_list}}"
  - name: after converting 
    ansible.builtin.debug:
      msg: "{{my_list | items2dict}}"

- name: convert dict to list/items 
  hosts: localhost
  vars:
    my_dict:
      course: 'ansible'
      trainer: 'sivakumar'
      duration: '120 hrs'
  tasks:
  - name: before convert
    ansible.builtin.debug:
      msg: "{{my_dict}}"
  - name: after converting 
    ansible.builtin.debug:
      msg: "{{my_dict | dict2items}}"
```
```
ansible-playbook -i inventory.ini -e ansible_user=ec2-user -e ansible_password=DevOps321 14-filters.yaml 
```
![Screenshot 2025-04-28 193320](https://github.com/user-attachments/assets/e542fa0b-de44-4fcb-a534-047ed96d2d3f)

![Screenshot 2025-04-28 193352](https://github.com/user-attachments/assets/dd2a792c-febc-4af4-8446-030a986222f0)

![Screenshot 2025-04-28 193407](https://github.com/user-attachments/assets/2d064e9a-7312-4690-9df2-733127393c86)


## 15-loops.yaml
```
- name: demo on loops
  hosts: localhost
  tasks:
  - name: print names
    ansible.builtin.debug:
      msg: "Hello {{item}}"
    loop:
    - Linux
    - Shell script
    - Ansible
```
```
ansible-playbook -i inventory.ini -e ansible_user=ec2-user -e ansible_password=DevOps321 15-loops.yaml 
```
![Screenshot 2025-04-28 151627](https://github.com/user-attachments/assets/113e7f28-51bf-4776-9681-b2ae73097124)

## 16-loops.yaml
```
- name: install packages
  hosts: localhost
  become: yes
  tasks:
  - name: install packages
    ansible.builtin.dnf:
      name: "{{item}}"
      state: latest
    loop:
    - mysql
    - nginx
```
```
ansible-playbook -i inventory.ini -e ansible_user=ec2-user -e ansible_password=DevOps321 16-loops.yaml 
```
![Screenshot 2025-04-28 152619](https://github.com/user-attachments/assets/44321428-3936-461e-9a06-93336198a660)

## 17-loops.yaml
```
- name: install packages
  hosts: web
  become: yes
  tasks:
  - name: install packages
    ansible.builtin.dnf:
      name: "{{ item.name }}"
      state: "{{ item.state }}"
    loop:
    - { name: 'mysql', state: 'latest'} # item
    - { name: 'nginx', state: 'absent'}
    - { name: 'postfix', state: 'absent'}
```
```
ansible-playbook -i inventory.ini -e ansible_user=ec2-user -e ansible_password=DevOps321 17-loops.yaml 
```
![Screenshot 2025-04-28 154207](https://github.com/user-attachments/assets/f71d9b89-0595-43ca-8451-725bc6469b9a)

## 18-command-vs-shell.yaml
```
- name: command vs shell
  hosts: localhost
  tasks:
  - name: command module
    ansible.builtin.command: "echo 'Hi, this is from command module' > /tmp/command.txt "

  - name: shell module
    ansible.builtin.shell: "echo 'Hi, this is from shell module' > /tmp/shell.txt "

    # simple commands without the need of shell variables, envrironment and features like redirections, pipes, & go for command module.
    # If we need to run complex commands or scripts go for shell module.
    # Whatever works in command module, it will work in shell module, but vice versa is not true.
```
```
ansible-playbook -i inventory.ini -e ansible_user=ec2-user -e ansible_password=DevOps321 18-command-vs-shell.yaml 
```
![Screenshot 2025-04-28 200204](https://github.com/user-attachments/assets/fd441cbc-d2f0-48c9-aa76-ac34d8dd9144)

![Screenshot 2025-04-28 200225](https://github.com/user-attachments/assets/a46f78bc-0a19-471f-b78e-e593082ebb48)









