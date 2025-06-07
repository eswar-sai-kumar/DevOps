# Docker 

- **sudo usermod -aG docker ec2-user**  → It adds the ec2-user to the docker group, allowing the user to run Docker commands without needing sudo every time.

- **docker images** → List down the docker images

- **docker pull nginx:<tag>** → Pulls the specific version nginx image from Docker Hub to your local machine.

- **docker pull nginx** → Pulls the latest version nginx image from Docker Hub to your local machine.

- **docker create <image>:tag** → Creates container (tag refers to version)

- **docker create nginx** → Create nginx container of latest version (no tag provided)

- **docker ps** → Show running containers

- **docker ps -a** → Shows all containers with any status

- **docker start <container_id>** → Container starts running

- **docker stop <container_id>** → Stops container

- **docker rm <container_id>** → Deletes container

- **docker run** → docker pull+ docker create + docker starts running

- **docker rmi <image_id>** → Deletes the image

- docker rmi `docker images -a -q` → Delets all images

- docker rmi `docker ps -a -q` → Deletes all containers



