# uwsgi 配置

> 同时也是 《Django + nginx + uwsgi + ubuntu 搭建系列》的第 6 篇
----

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
socket = :8000
#http = 0.0.0.0:8000
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
daemonize=uwsgi.log
# 利用cat uwsgi.log 可以查看日志
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



----
#### 查看端口占用情况

可能需要安装：
```
apt install gawk
```
```
sudo ss -tulpn | gawk '{printf "%-6s %-9s %-19s %s\n", $1, $2, $5, $7}'
```

---
### 开启 uwsgi
```
killall -9 uwsgi
uwsgi --ini uwsgi.ini
service nginx reload
```

### 重装 uwsgi
- 不适用缓存 --no-cache-dir
- 强制重装 -I
```
pip install uwsgi -I --no-cache-dir
```

运行脚本
在项目根目录下
> 新建 run.sh 脚本

```
vi run.sh
```

> 输入

```
#!/bin/sh
killall -9 uwsgi
uwsgi --ini uwsgi.ini
service nginx reload
```
> 运行

```
./run.sh
```
> 发现报错，权限不足，故给 run.sh 添加权限

```
chmod u+x run.sh
```

再次执行，成功。