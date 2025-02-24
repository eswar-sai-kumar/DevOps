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

![image](https://github.com/user-attachments/assets/535ee616-b5ce-49e9-a5ee-987c7f85faae)

cut command used to get fragments of a text using delimiter

Ex : Eswar Sai Kumar = Eswar, Sai, Kumar (Here space is delimiter)

syntax : cut -d "delimiter" -f1   (f1 represents first fragment)

echo Hello == Hello


![image](https://github.com/user-attachments/assets/7751dd67-f8c3-4a94-b762-d740fdb8e691)

awk command used for text processing 

awk is generally used to divide text in column format

cat /etc/passwd == displays user account information

cat /etc/passwd | awk -F ":" '{print $1F}'  == get all the names of the users

![image](https://github.com/user-attachments/assets/533fa3ba-83a7-4f25-be77-f958de33836f)

cat /etc/passwd | awk -F ":" '{print $NF}'  == get the last fragement of every user account information


![image](https://github.com/user-attachments/assets/2294b4e9-ade1-44f5-a197-f2584c844a09)

head file_name == gives first 10 lines of the file

tail file_name == gives last 10 lines of the file

head -n 2 file_name == gives first 2 lines of the file

tail -n 2 file_name == gives last 2 lines of the file

![WhatsApp Image 2025-02-24 at 08 34 07_5f2f0022](https://github.com/user-attachments/assets/f8b18d64-63a5-4784-8baf-ea23ec7da5bb)

Editor in Linux : we can edit the file here.

Three modes available 1. Esc mode  2. Colon/command mode  3. Insert mode

![image](https://github.com/user-attachments/assets/936f3200-4de2-441e-83e2-989bbf212654)

vim <file_name> == open the vim editor for given file

![image](https://github.com/user-attachments/assets/e25b4b11-59b7-490a-b3e0-93c6f2b41b34)

after entering the vim command

![image](https://github.com/user-attachments/assets/143cd782-651c-48c9-aae3-b7f5bb71e763)

If we want to insert something, have to type "i"

:q == quit(come out of file)

:q! == force quit, do not save the changes that we have done

:wq == write and quit

![image](https://github.com/user-attachments/assets/7494dc10-c286-4908-b460-e3669f8068e1)

:set nu == we can see numbers 

:set nonu == we do not see numbers

![image](https://github.com/user-attachments/assets/0eedfe65-aa36-4c4a-a25a-dbfd2e89f210)

**colon mode commands:** 

:/word-to-find == searches word from top and highlights if word is there

:?word-to-find == searches word from bottom and highlights if word is there

:noh == no highlight

:s/bin/BIN == replaces bin with BIN in the line where cursor is

:%s/bin/BIN == replaces every line 'bin' with 'BIN' but only first occurence

:%s/bin/BIN/g == replaces every line 'bin' with 'BIN'  

:10s/bin/BIN == replaces 10th line 'bin' with 'BIN' but only first occurence

:10s/bin/BIN/g == replaces 10th line 'bin' with 'BIN' every occurence

:%d  == deletes everything in the file

**Escape mode commands:**

u == undo

yy == copy

p == paste

10p == 10 times paste

dd == cut

shift+g == go to bottom

gg == go to top

![image](https://github.com/user-attachments/assets/d1a1d7e0-e94c-46ee-8bd1-abe5bc767096)

![image](https://github.com/user-attachments/assets/a3f00ece-81c0-4c04-a603-27f764a210bb)

![image](https://github.com/user-attachments/assets/8918ff41-1e05-414e-820d-da975c10fa44)

view <file_name> == view only,cant edit the file, can use all commands present in esc mode and colon mode

![image](https://github.com/user-attachments/assets/e1ee732d-4e5e-4ca6-a04d-7f2f5328dc38)

Read(r) == 4

Write(w) == 2

Execute(x) == 1

chmod command used to change permissions of the file

Imagine if the file permissions are like this  

- rw- rw- r--  ==  first rw(read write) is for user(u), 2nd rw is for group(g),r is for others(o)

chmod o+x file1 == gives execute permissions for others to file1

chmod g+x file2 == gives execute permissions for group to file2

chmod u+x file3 == gives execute permissions for user to file3

chmod g-x file2 == removes execute permission for group to file2

chmod ugo+rwx file4 == gives all permissions for user,group,others to file4

chmod 765 file1 ==  7 means rwx(4+2+1) for user , 6 means rw(4+2) for group, 5 means rx(4+1) for others





 


 























