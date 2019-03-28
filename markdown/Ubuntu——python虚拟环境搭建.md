# Python 虚拟环境搭建

> 同时也是 《Django + nginx + uwsgi + ubuntu 搭建系列》的第 2 篇
----
> 本文内容列表：
> - 安装python3
> - 安装pip和virtualenv
> - 创建虚拟环境
> - 安装django

---
### 安装python3
```
apt-get install python3.6
```
---
### 安装pip和virtualenv
```
apt-get install python-pip
apt-get install python-virtualenv
```

---
### 创建虚拟环境
然后，`cd /home`
```
virtualenv -p /usr/bin/python3.6 py3env
```
注意上面的指令，`/usr/bin/python3.6`为python3的目录，如果不填默认创建的是python2的虚拟环境；`py3env`是自己起的文件名，执行成功，则会创建出一个目录：`/home/py3env`。

> 激活该虚拟环境
```
source py3env/bin/activate
```
退出虚拟环境命令是：`deactivate`

----
### 安装Django
激活虚拟环境的情况下：
```
pip install django
```
> 如果报错，根据指令更新 pip 即可
----
### （可选）设置Ubuntu输入python时默认启动Python3

> 修改别名的方法只能暂时改变默认的`python`版本，一旦换个窗口就恢复原样了。

先输入：
```
sudo update-alternatives --install /usr/bin/python python /usr/bin/python2 100
```

然后：
```
sudo update-alternatives --install /urs/bin/python python /usr/bin/python3 200
```

设置完后用该命令测试当前默认python版本：
```
python --version
```

----
### pip命令报错 "/usr/local/bin/pip", line 7, in <module>


随便找一个文件夹，输入以下命令，完事后再把get-pip.py 删掉即可（不删也没影响）
```
wget https://bootstrap.pypa.io/get-pip.py
sudo python get-pip.py
```
> root 账户不需要加`sudo`

----

### 安装 pyenv 出错
> 如果不是root 用户，可能会出现下面这个bug
```
sudo chmod 777 /home/lcb/.pyenv
```
----