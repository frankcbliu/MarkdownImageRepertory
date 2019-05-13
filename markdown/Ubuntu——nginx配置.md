# django项目连接 服务器mysql服务

> 同时也是 《Django + nginx + uwsgi + ubuntu 搭建系列》的第 7 篇
----
### 安装nginx

```shell
apt install nginx
```

----
修改地址：/etc/nginx/sites-available/default

`cd /etc/nginx/sites-available`
`cp default default.bak` 备份
`vi default` 然后将下方内容拷贝进去

```python
# 无关的注释已经被我省略了
server {
        listen 80;
        #listen [::]:80 default_server;

        index index.html index.htm index.nginx-debian.html;

        server_name 47.112.111.253; # 服务器地址

        location / {
                uwsgi_pass 127.0.0.1:8000;
                include uwsgi_params;
                uwsgi_param UWSGI_PYHOME /home/py3env/venv; # 虚拟环境目录
                uwsgi_param UWSGI_CHDIR /home/py3env/NiceBlog; # 应用根目录
                uwsgi_param UWSGI_SCRIPT manage:app; # 启动程序
        }
        location /static {
                alias /home/py3env/NiceBlog/static;
        }

}
```

----
#### 启动nginx
```shell
service nginx start
service nginx stop
service nginx restart
```