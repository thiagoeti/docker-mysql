# Docker - MySQL

Database most popular among developers.

Get container **pull**.

```console
docker pull "mysql"
```

Create **network** for data.

```console
docker network create "mysql"
```

Create **volume** for data.

```console
docker volume create "mysql"
ln -s "/var/lib/docker/volumes/mysql" "/data/volume/"
```

Create and **run** container.

```console
docker run --name "mysql" \
  -p 3306:3306 \
  --network "mysql" \
  -v "mysql":"/var/lib/mysql" \
  -e MYSQL_ROOT_PASSWORD="master" \
  --restart=always \
  -d "mysql":"latest"
```

Start container.

```console
docker start "mysql"
```

Access container.

```console
docker exec -it "mysql" "/bin/bash"
```

In container execute.

```console
mysql --user=root --password
```

> Important: enter password equal creation of container.

In MySQL execute.

```sql
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'master';
ALTER USER 'root'@'%' IDENTIFIED WITH mysql_native_password BY 'master';
```
