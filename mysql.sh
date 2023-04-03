#!/bin/sh

# pull
docker pull "mysql"

# network
docker network create "mysql"

# volume
docker volume create "mysql"
ln -s "/var/lib/docker/volumes/mysql" "/data/volume/"

# drop
docker rm -f "mysql"

# run
docker run --name "mysql" \
  -p 3306:3306 \
  --network "mysql" \
  -v "mysql":"/var/lib/mysql" \
  -e MYSQL_ROOT_PASSWORD="master" \
  --restart=always \
  -d "mysql":"latest"

# start
docker start "mysql"

# exec
docker exec -it "mysql" "/bin/bash"

# mysql

mysql --user=root --password

# enter password: master

# sql

ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'master';
ALTER USER 'root'@'%' IDENTIFIED WITH mysql_native_password BY 'master';

#
