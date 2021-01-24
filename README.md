# volumes

1.`newgrp docker` 切换 docker 组

2.`docker network create -d bridge project` 创建 docker 网络

## 1.MySQL 容器准备及启动
### 准备:
1.`docker image pull mysql:8.0.0` 拉取最新的 mysql 8.0.0镜像

2.`mkdir -p mysql/data/ mysql/log/` 创建数据持久文件夹和日志文件夹

3.`chmod 777 mysql/log/` 放开日志文件夹的权限

### 启动:

1.启动容器
```
docker container run -d --name mysql-service \
-p 7000:3306 --network project \
--mount type=bind,src=$PWD/mysql,dst=/mysql \
-e MYSQL_ROOT_PASSWORD="root" \
mysql:8.0.0 --defaults-file=/mysql/conf/my.cnf
```

2.`cp global.sql mysql/` 复制 global.sql 文件到挂载卷中

3.`docker container exec -it mysql-service /bin/bash` 进入容器

4.`mysql --user root --password` 进入 mysql 输入密码

5.`source /mysql/global.sql;` 导入 global.sql 文件

6.`exit` 退出容器中的 MySQL 操作

7.`exit` 退出容器

8.`rm mysql/global.sql` 删除挂载卷中的 global.sql 文件

## 2.Redis 容器准备及启动
### 准备:
1.`docker image pull redis:6.0.10` 拉取最新的 redis 6.0.10版本镜像

2.`mkdir -p redis/data/ redis/log/` 创建数据持久文件夹和日志文件夹

3.`chmod 777 redis/log/ redis/data/` 放开数据持久文件夹和日志文件夹的权限

### 启动:

1.启动容器

```
docker container run -d --name redis-service -p 8000:6379 --network project \
--mount type=bind,src=$PWD/redis,dst=/redis \
redis:6.0.10 /redis/conf/redis.conf
```

2.`docker container exec -it redis-service /bin/bash` 进入容器

3.`redis-cli` 进入 redis 中

4.`auth frank123` 校验通过

5.`set name frank` 放入一个任意值

6.`save` 保存，此时立即将数据持久化，宿主机 `$PWD/redis/data/` 数据文件夹中就能看到保存的数据

7.`del name` 删除刚刚保存的任意值

## 3.MongoDB 容器准备及启动
### 准备:
1.`docker image pull mongo:4.4.3` 拉取最新的 mongo 4.4.3版本镜像

2.`mkdir -p mongo/data/ mongo/log/` 创建数据持久文件夹和日志文件夹

3.`chmod 777 mongo/log/ mongo/data/` 放开数据持久文件夹和日志文件夹的权限

### 启动:

1.启动容器

```
docker container run -d --name mongo-service -p 9000:27017 --network project \
--mount type=bind,src=$PWD/mongo,dst=/mongo \
mongo:4.4.3 -f /mongo/conf/mongod.conf
```

2.`docker container exec -it mongo-service /bin/bash` 进入容器

3.`mongo` 进入 mongo 客户端命令行 中

4.`use admin` 使用 admin 集合

5.`db.createUser({user:"userManager",pwd:"userManager",roles:[{role:"userAdminAnyDatabase",db:"admin"}]})` 创建账号管理账户

6.`db.auth("userManager","userManager")` 校验账号管理账户

7.`use jarvis` 切换到 jarvis 集合

8.`db.createUser({user:"frank",pwd:"frank123",roles:[{role:"readWrite",db:"jarvis"}]})` 创建 jarvis 集合的使用账户

9.`exit` 退出 mongo 客户端命令行

10.`exit` 退出 mongo-service 容器

11.`docker container restart mongo-service` 重启 mongo-service 容器