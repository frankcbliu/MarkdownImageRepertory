# Git 常用指令

> 同时也是 《Django + nginx + uwsgi + ubuntu 搭建系列》的第 3 篇
----
> 本文内容列表：
> - 安装 Git
> - Git 常用命令
> - ubuntu 下使用第一次可能出现的小BUG
> - Git 如何忽略本地某个文件的更新
> - Github 误传文件如何删除记录


-----
## 安装 git
> 因为我的 django 项目放在GitHub 上，故用git 来安装。

```
apt-get install git
```

----
 ## Git 相关操作

> git clone使用了SSH，而不是HTTPS：就不用每次push都要输入账号密码

![](https://github.com/learningNicolas/MarkdownImageRepertory/blob/master/image/2019-03-18-10-53-36.png?raw=true)

### 常用指令

- `git clone 地址`
- `git add .` 增加所有修改过的文件
- `git commit -m "提交变化的名称"` 
- `git push origin master` 提交到GitHub 

----
## 第一次使用会出现的BUG
> Warning: Permanently added the RSA host key for IP address '13.250.177.223' to the list of known hosts.

solution:
back to etc dir: `cd /etc`

and then, `vi host`
add this line：`13.250.177.223 github.com`

----
### Git 如何忽略本地某个文件的更新
1. 使用 `.gitignore`

> .gitignore只能忽略那些原来没有被track的文件，如果某些文件已经被纳入了版本管理中，则修改.gitignore是无效的。

> 那么解决方法就是先把本地缓存删除（改变成未track状态），然后再提交：

```
git rm -r --cached . 
```
这样有个问题，就是GitHub上这个文件也会消失（记录不会消失）

2. 【推荐】为了让GitHub上保留这个文件，只是本地修改不推上GitHub，采用以下办法

```
git update-index --assume-unchanged PATH 
```
在PATH处输入要忽略的文件路径。

> 例子：
> 根目录为NiceBlog，其下还有个a目录，a目录与.gitignore文件同在NiceBlog目录下，为了忽略a目录下的b.py文件，我们可以这样子用

```
git update-index --assume-unchanged ./a/b.py 
```
----

### Github 误传文件如何删除记录

https://www.cnblogs.com/shines77/p/3460274.html

```
git reset --hard HEAD^ 
git push --force
```

----
## .gitignore 使用方法
> 忽略gitignore文件
.gitignore

> 忽略.idea文件夹
./.idea/

> 忽略后缀名为txt的文件
*.txt

> 取消忽略a.txt文件
!a.txt