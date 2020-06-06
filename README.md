# micro-springboot

This is a demo for creating a Spring Boot web application with small Docker image size (80 MB).

The idea comes from https://www.youtube.com/watch?v=Yj0sx1dvEdo.

### Image size

Link on Docker hub: https://hub.docker.com/repository/docker/tranngockhoa/micro-springboot/tags?page=1

```shell script
$ docker images tranngockhoa/micro-springboot
```

```shell script
REPOSITORY                      TAG                 IMAGE ID            CREATED             SIZE
tranngockhoa/micro-springboot   latest              62af900e28f3        29 minutes ago      79.6MB
```

### Memory consume
```shell script
$ docker container stop $(docker container ls -aq --filter name='micro-springboot')
$ docker container rm $(docker container ls -aq --filter name='micro-springboot')
$ docker run -p 8080:8080 --name micro-springboot --detach tranngockhoa/micro-springboot

$ docker stats --all micro-springboot
```
```shell script
CONTAINER ID        NAME                CPU %               MEM USAGE / LIMIT   MEM %               NET I/O             BLOCK I/O           PIDS
6e802ac34f2c        micro-springboot    0.43%               116MiB / 1.945GiB   5.82%               836B / 0B           0B / 0B             35
```

## Using jdeps to determine which modules to include:

```shell script
$ jdeps -s target/micro.jar.original 
```

The command above has a bug 