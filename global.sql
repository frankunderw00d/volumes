# [!!!] 更换 root 密码
use mysql;
# 同时修改远程登录和本地登录的秘密
alter user 'root'@'%' identified by 'frank123';
alter user 'root'@'localhost' identified by 'frank123';
# 刷入权限
flush privileges;

# 创建数据库
create database `jarvis`;
# 创建用户
create user 'frank'@'%' identified by 'frank123';
# 给予用户对 jarvis 的全部权限
grant all privileges on `jarvis`.* to 'frank'@'%';
# 刷入权限
flush privileges ;
# 设置编码
set names utf8;
# 切换到 jarvis
use `jarvis`;



# 创建一些全局表和导入一些数据

# 业主平台表定义了当前服务器维护的业主，id为其编号
create table if not exists `static_platform`(
    id int auto_increment comment '唯一id',
    name varchar(50) not null comment '平台名',
    link varchar(200) comment '链接',
    owner varchar(50) not null comment '所有者',
    create_at timestamp not null default current_timestamp,
    update_at timestamp not null default current_timestamp on update current_timestamp,
    primary key(id)
)engine = innodb , default charset = utf8 , comment '业主平台表';

insert into `static_platform`(name, link, owner) values ('开发盘','http://www.google.com/','frank-underwood'),
                                                        ('开发测试盘','http://www.twitter.com/','frank-underwo0d');

select * from `static_platform`;

# 账号表代表面向服务器的一个账号
create table if not exists `dynamic_account`(
    id int auto_increment comment 'id',
    token varchar(20) not null unique comment '账号绑定token，内部分配唯一标识',
    account varchar(20) not null unique comment '账号，也需要全局唯一',
    password varchar(20) not null comment '账号密码',
    type int not null default 0 comment '账户类别 0 - 游客, 1 - 绑定用户',
    platform int not null comment '账号所属平台',
    primary key (id)
)engine=innodb,default charset = utf8 , comment '账号表';
