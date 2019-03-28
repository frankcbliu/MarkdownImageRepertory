# django项目连接 服务器mysql服务

> 同时也是 《Django + nginx + uwsgi + ubuntu 搭建系列》的第 4 篇

----
### ubuntu 安装mysql
```ubuntu
apt-get install mysql-server
apt-get install mysql-client
apt-get install libmysqlclient-dev
```
> 查看mysql线程

```
sudo netstat -tap | grep mysql
```
> 进入mysql语句中

```
mysql -u root -p 
```

```
show databases; //展示mysql中的数据库
exit //退出
```

```
service mysql start //启动mysql
service mysql restart //重启mysql
service msyql status //查看mysql状态
```

> 安装mysql-python，此部分有些混乱，当时遇到了不少坑，不确定哪些步骤可以省略

> 如果已经是root 用户的话，就不需要 `sudo`
```
apt-get install rpm
sudo apt-get install python-setuptools
sudo apt-get install libmysqld-dev
sudo apt-get install python-dev
```

此处本还有一个`python -m pip install mysql-python`，但会报错，是py2和py3的版本问题导致的，我懒得找源码所在去修改，就改用以下方法解决

----
### 使用pymysql 代替 MySQLdb
> 在 Ubuntu 中键入：
```
pip install pymysql
```

- 在Django 项目中，假设工程名为 NiceBlog，则在`NiceBlog/NiceBlog/__init__.py`中加入以下代码：

```python
import pymysql
pymysql.install_as_MySQLdb()
```
- 在setting.py中，找到数据库所在位置，修改为

```
DATABASES = {
'default': {
        'ENGINE': 'django.db.backends.mysql',
        'HOST': '阿里云服务器的公网ip',# mysql 开放的地址，如果是本机则保留127.0.0.1
        'PORT': '3306',
        'NAME': 'mysql',
        'USER': 'root',
        'PASSWORD': 'mysql密码',
    }
}
```
- 在阿里云服务器的**安全组规则**中添加一条安全规则

入方向：
> - 端口范围：3306/3306
> - 授权对象：0.0.0.0/0  //这是为了对所有IP开放

其他的默认即可。

---
### mysql 外网访问配置
> 到这里还没完，mysql默认只允许本地访问，所以还需要配置mysql

在 ubuntu 中，键入以下命令
```
sudo vi /etc/mysql/mysql.conf.d/mysqld.cnf
```
按住↓方向键找到bind-address，按下Insert（或者 i ）进行修改

将bind-address 那一行改为

```
bind-address   = 0.0.0.0
```
按 ESC 退出 Insert，并输入`:wq`，回车保存并退出。

---



