#!/bin/bash
mvn clean package -DskipTests=true;
docker build -t tranngockhoa/micro-springboot .