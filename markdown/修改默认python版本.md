
----

## 查看mysql 用户
```
mysql -u root -p //以root账户登陆之后
use mysql
select user from user;
```

## 修改root 用户的密码

```
use mysql
update user set authentication_string=PASSWORD("这里输入你要改的密码") where User='root'; #更改密码
update user set plugin="mysql_native_password"; #如果没这一行可能也会报一个错误，因此需要运行这一行
flush privileges; #更新所有操作权限
quit;
```

----

---
## Django 与 Vue

1. Django 项目新建了一个app后，假设app名为 blog，在/blog/views.py 中，加入该行代码：

```python
def index(request):
    return render(request,'index.html')
```
2. 修改 NiceBlog/NiceBlog/urls.py （我的Django项目名为NiceBlog）

```python
# 该行根据你的app名进行修改
from blog import views
urlpatterns = [
    path('admin/', admin.site.urls),
    path('',views.index),
]
```

3. Vue 打包之后有一个dict文件夹，我改名为frontend，然后放在项目根目录下，项目结构大致如下：

> 带 / 的为文件夹

#### NiceBlog
- blog /
> - ...
> - views.py
-  frontend /
> - static /
>> - css /
>> - js /
> - index.html
- NiceBlog /
> - ...
> - settings.py
> - urls.py
- manage.py

4. 修改settings.py

```
TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [os.path.join(BASE_DIR,'frontend')], # 注意此处
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]

...

STATIC_URL = '/static/'
# 静态文件主目录
STATICFILES_DIRS = [
    os.path.join(BASE_DIR, "frontend/static"),# 路由到static文件夹位置
]

```

查看端口占用情况

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






