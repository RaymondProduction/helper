# Docker

## Install Docker

```sh
$ sudo apt-get update
$ sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
$ sudo apt-add-repository 'deb https://apt.dockerproject.org/repo ubuntu-xenial main'
$ sudo apt-get update
$ sudo apt-get install -y docker-engine
```
V   
After install we need to make sure that demon of _Docker_ is active.

```sh
$ sudo systemctl status docker
```

## Use Docker

```sh
$ docker [option] [command] [arguments]
```
All the commands that you can look at 
```sh
$ docker
```

### Run image

```sh
$ docker run hello-world
```

After that image name _'hello-world'_ will be downloaded from _Docker Hub_ (if it isn't in the local computer) and run.

So, that to run image

```sh
$ docker run <image>
```

### Search images in _Docker Hub_

```sh
$ docker search <image>
```

### Download in the local computer

```sh
$ docker pull <image>
```

### Get list of images in your computer

```sh
$ docker images
```

### Interactive access to image

```sh
docker run -it <image>
```

**for example:**

```sh
docker run -it ubuntu
```
You will see
```
root@2ae0afd0277e:/#
```

_So, **2ae0afd0277e** is identification of container - CONTAINER ID_

CONTAINER ID  you can see so
```sh
$ docker ps
```
Show with use format
```bash
$ sudo docker ps --format "table {{.ID}}\t{{.Names}}\t{{.Image}}"
```

### Save change in the image
```sh
$ docker commit -m <massage> -a <author> <CONTAINER_ID> <name new repository>
```

### Show containers

```sh
$ docker ps
```

All containers

```sh
$ docker ps -a
```

Show last cintainer

```sh
$ docker ps -l
```

### Logs of containers

```sh
$ docker logs --follow <CONTAINER_NAME or CONTAINER_ID>
```

### Stopping container

```sh
$ docker stop
```

### Sending Docker containers to the _Docker Hub_

Authorization 
```sh
$ docker login -u <User name in Docker Hub>
```

Sending
```sh
$ docker tag <image> <User name in Docker Hub>/<image>
$ docker push <User name in Docker Hub>/<image>
```

### Delete all images and containers

Bash script for delete
```sh
#!/bin/bash
# Delete all containers
docker rm $(docker ps -a -q)
# Delete all images
docker rmi $(docker images -q)
```

[Docker Web Server](https://github.com/RaymondProduction/helper/blob/master/manuals/docker-webserver.md)
