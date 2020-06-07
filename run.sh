#!/bin/bash
docker container stop $(docker container ls -aq --filter name='micro-springboot')
docker container rm $(docker container ls -aq --filter name='micro-springboot')

docker run -p 8080:8080 --name micro-springboot --detach tranngockhoa/micro-springboot:latest
