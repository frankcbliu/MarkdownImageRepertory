# Django + nginx + uwsgi + ubuntu 搭建系列总览

> **好文章带你上天堂，坏文章带你瞎逼忙**，这句话真是太对了，折腾了两天，大多数都是一些抄来抄去的博客 将你从一个坑带入另一个坑。

> 本文是《Django + nginx + uwsgi + ubuntu 搭建系列》的第 0 篇

优秀参考blog：https://www.yukunweb.com/2017/12/ubuntu-nginx-uwsgi-flask-app/

---
## 不描述搭建环境就带你入坑，绝壁都是耍流氓
- 系统：Ubuntu 18.04 64位
- python版本：3.6.7
- Django版本：2.1.7
- nginx版本：1.14.0
- uwsgi版本：2.0.18

----
## 梳理整个流程
> 背景设定，为了完整的流程，我假定你是刚上手阿里云的服务器，也就是从0开始。（如果已经完成某些步骤，可以根据需要跳过完成的步骤）整体流程如下：

0. 总览
1. 系统环境准备
2. python 环境准备，搭建虚拟环境
3. git 准备
4. Django 项目准备（从GitHub上下载到Ubuntu上）
5. mysql 环境准备（安装，配置允许访问的ip，修改字符集），测试 Django项目
6. uwsgi 搭建，测试uwsgi
7. nginx 搭建，测试nginx
8. 大功告成，记录常用命令，写成脚本，方便运行

----
### 系统环境准备

详情见：第1篇

---
###  Python 环境准备

详情见：第2篇

----
### Git 环境准备
详情见：第3篇

----
### django 环境准备 
详情见：第4篇

----
### mysql 环境准备
详情见：第4篇

-----
### 安装uwsgi

项目根目录下：（/home/py3env/NiceBlog/）

创建 uwsgi.ini 文件
```
vi uwsgi.ini
```
复制以下内容
```
[uwsgi]

# 指定端口号
#socket = :8000
http = 0.0.0.0:8000
# 指定项目的目录
#chdir           = /home/py3env/NiceBlog
# module = hello.wsgi 可以这么来理解。对于 uwsgi.ini 文件而言，
# 与它同级目录有一个 myweb 目录，这个目录下有一个 wsgi.py 文件。
#module          = NiceBlog.wsgi
module = NiceBlog.wsgi:application
# 允许主进程存在
master          = true
# 开启的进程数量
processes       = 1
# 当服务器退出的时候自动清理环境，删除 unix socket 文件和 pid 文件
vacuum          = true
master = True
#max-requests = 5000
pidfile=uwsgi.pid
# 设置静态文件
static-map = /static/=/home/py3env/NiceBlog/static
daemonize=uwsgi.log # 利用cat uwsgi.log 可以查看日志
uid=root
gid=root
wsgi-file= manage.py

```

注意这两行：
```
#socket = :8000
http = 0.0.0.0:8000
```
此处先使用http是为了方便测试。


django 项目中，修改完setting 后，要
```
python manage.py collectstatic
```


https://www.cnblogs.com/aaanthony/p/7428849.html

---