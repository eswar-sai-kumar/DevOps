
# EC2 Server Launch

We will launch EC2 server here. We will generate public key(.pub extension) and private key(.pem file) pair in Linux. After we import key pair in AWS. We create firewall(creating security group). We launch EC2 server.

# Process
![ss1](https://github.com/user-attachments/assets/0d438925-3eff-4281-b0d1-e3e26efc4f77)

pwd               -> present working directory

cd directory_path -> change directory to given path

ls                -> list all the files and directories in current working directory

ssh-keygen --help -> we get use of this command

![ss2](https://github.com/user-attachments/assets/e98fe50f-92d1-45e0-8b44-9de72285def5)  

ssh-keygen -t rsa -b 4096 -f daws -> Generates public and private key pair

