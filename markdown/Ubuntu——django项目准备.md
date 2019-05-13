# Django 项目准备

> 同时也是 《Django + nginx + uwsgi + ubuntu 搭建系列》的第 4 篇
----

下方介绍了与vue 的配合使用方法，如果无前端知识储备，可以用postman来模拟请求（当然如果写get请求，直接在浏览器上也ok）

----
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
-  static /
> - css /
> - js /
- template / 
> - index.html
- NiceBlog /
> - ...
> - settings.py
> - urls.py
- manage.py

---
4. 修改settings.py


---

### django settings.py

> 因为篇幅原因，未修改的地方都省略掉了，只留下改动过的地方。
```python
DEBUG = True

ALLOWED_HOSTS = ['*']

# Application definition
INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'blog'
]

MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
#    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
]

ROOT_URLCONF = 'NiceBlog.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [os.path.join(BASE_DIR,'template')],# 模板路径
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

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'HOST': '127.0.0.1',# mysql 开放的地址，如果是本机则保留127.0.0.1
        'PORT': '3306',
        'NAME': 'database's name',
        'USER': 'root',
        'PASSWORD': 'password', # mysql 的密码
    }
}

LANGUAGE_CODE = 'zh-hans'

TIME_ZONE = 'Asia/Shanghai'

ROOT_URL =  '填写本机外网ip'

STATIC_URL = '/static/'
STATIC_ROOT = os.path.join(BASE_DIR, '/static/')

# 静态文件主目录
STATICFILES_DIRS = [
    os.path.join(BASE_DIR, "static"),# 路由到static文件夹位置
]

```

### 找不到static静态资源

解决方法：

```python
STATIC_URL = '/static/'
STATIC_ROOT = os.path.join(BASE_DIR, '/static/')
# STATIC_ROOT 的正确配置：'/static/' ，错误配置：'static'
# 静态文件主目录
STATICFILES_DIRS = [
    os.path.join(BASE_DIR, "static"),# 路由到static文件夹位置
]
```