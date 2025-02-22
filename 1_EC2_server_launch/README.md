# EC2 Server Launch

We will launch EC2 server here. We will generate public key(.pub extension) and private key(.pem file) pair in Linux. After we import key pair in AWS. We create firewall(creating security group). We launch EC2 server and practice some commands

# Process
![ss1](https://github.com/user-attachments/assets/0d438925-3eff-4281-b0d1-e3e26efc4f77)

pwd               -> present working directory

cd directory_path -> change directory to given path

ls                -> list all the files and directories in current working directory

ssh-keygen --help -> we get use of this command

![ss2](https://github.com/user-attachments/assets/e98fe50f-92d1-45e0-8b44-9de72285def5)  

ssh-keygen -t rsa -b 4096 -f daws -> Generates public and private key pair

![image](https://github.com/user-attachments/assets/15c8625a-6116-4013-a5b4-8311f82866ed)

we import key pair here. We have to give key pair name and paste the public key. Then Click on the import key pair.

![image](https://github.com/user-attachments/assets/b3c6b7a3-151b-45ce-b03d-c2f48f61a9a6)

Creating security group here. Making inbound rule type as all traffic and source as Anywhere. Then click on create security group.

![image](https://github.com/user-attachments/assets/65942949-539d-4cbf-a926-763360781609)

Launching an EC2 instance by selecting Amazon Linux 2 AMI, select the name of the key pair and security group that we created. Then click on launch instance

![image](https://github.com/user-attachments/assets/61cd4133-5b7d-4aac-8a20-d98c1d09ddc0)

We can see instance was runnning. Copy the IP address.

![image](https://github.com/user-attachments/assets/139313b9-bebe-4963-98cd-6d49087ddc46)

syntax: ssh -i <private-key> username@IP

ssh -i daws.pem ec2-server@13.61.18.185

Now we will be on the Linux server

![image](https://github.com/user-attachments/assets/096a2c44-f27e-490a-b608-d0a1eef0d074)

history == our commands history can be seen

CRUD = Create,Read,Update,Delete

touch <file_name> == this will creates file

cat file_name     == reads the file

cat>file_name     == updates the file by replacing old content, after entering text, click enter and ctrl+d to update text

cat>>file_name    == updates the file by adding new content to old content

![image](https://github.com/user-attachments/assets/4a5276a7-e057-4688-84be-5f7f3fe2ff41)

rm file_name    ==  deletes the file

mkdir directory_name == make directory

rm -r dircetory_name == delete directory 

![image](https://github.com/user-attachments/assets/9bebdc1b-ee7b-4b80-8ca4-d07fe6da8250)

cp <source_file><destination_path> == copy command

created file1,file2,dir1,dir2 in the /home/ec2-user/. 

1. copied file1 into dir1 and file2 into dir2
  
2. Created file3 in dir1, copied this file3 into /home/ec2-user/

![image](https://github.com/user-attachments/assets/88461042-83fd-42b8-ab10-7a92d3ee9360)

mv <source_file><destination_path> == cut command

moved file1 into dir2

moved file1 present in dir1 into /home/ec2-user/

![image](https://github.com/user-attachments/assets/7fb001a4-5b69-4bb1-97fa-49e3ff6e007d)

grep <word-to-find> <file-name> == used to search for a word in a file

![image](https://github.com/user-attachments/assets/8ca81cb8-6a93-4386-a56b-f39e30be7667)

This is called piping. 1st command output will be input for 2nd command. We use '|' between commands

![image](https://github.com/user-attachments/assets/b29a2889-6cde-4baa-90f8-7ba816225395)

wget <url> == download the folder or software in linux

curl <url> == get text present in url directly on to the terminal

![image](https://github.com/user-attachments/assets/2294b4e9-ade1-44f5-a197-f2584c844a09)

head file_name == gives first 10 lines of the file

tail file_name == gives last 10 lines of the file

head -n 2 file_name == gives first 2 lines of the file

tail -n 2 file_name == gives last 2 lines of the file







 


 























