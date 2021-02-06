# [!!!] 更换 root 密码
use mysql;
# 同时修改远程登录和本地登录的秘密
alter user 'root'@'%' identified by 'frank123';
alter user 'root'@'localhost' identified by 'frank123';
# 刷入权限
flush privileges;


# 创建用户
create user 'frank'@'%' identified by 'frank123';
# 给予用户对 jarvis 的全部权限
grant all privileges on `jarvis`.* to 'frank'@'%';
# 刷入权限
flush privileges ;

# 设置编码
set names utf8mb4;