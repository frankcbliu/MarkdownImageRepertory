# Markdown + VsCode 
建立高效的笔记平台【可选：有道云笔记】
> 背景：有道云笔记的markdown 挺好用，但有个缺点就是不能使用本地图片（要开会员），作为吃土少年自然要想办法解决这种小case的问题啦

> 适合食用人群：对 git、markdown 有一定了解，想高效地对 markdown 的笔记进行同步和管理。（适合没钱或者不愿意花钱买有道云笔记会员的童鞋，有道云笔记不能调字体是个硬伤）

----
## 效果展示
1. 使用 vscode 写笔记（使用插件，可以用 微信/QQ 的快捷键截图，然后粘贴到vscode上）；（win10 快捷键：shift + win + S ）
2. 建立脚本，快速将图片上传到 GitHub 上；
3. 将 markdown 复制到有道云笔记上，方便整理和同步。

---
## 搭建步骤
1. 安装 VS code，有道云笔记，Git
2. vs code 上安装插件，修改快捷键，修改配置
3. 建立GitHub仓库，写脚本，同步图片

----
#### 安装 vscode

下载地址：https://code.visualstudio.com/

#### 安装 有道云笔记

下载地址：https://note.youdao.com/web/

#### 安装 Git，配置 GitHub
下载地址：https://git-scm.com/
配置：https://help.github.com/en

----
#### VsCode 插件
Markdown Preview Enhanced
> 教程：https://shd101wyy.github.io/markdown-preview-enhanced/#/zh-cn/

Paste Image

vscode 编辑器中：打开文件-> 首选项-> 设置
保持一个主窗口的情况下，找到 paste image 的配置

![](https://github.com/learningNicolas/MarkdownImageRepertory/blob/master/image/2019-03-22-15-06-35.png?raw=true)

> basePath 配置为 `${projectRoot}`

![](https://github.com/learningNicolas/MarkdownImageRepertory/blob/master/image/2019-03-22-15-07-24.png?raw=true)


> insert pattern 配置为：

> 注意，此处中间的http链接需要改为你自己的GitHub的地址，怎么拿到自己的地址呢？自己先在GitHub上创建一个仓库，放一个图片，chrome下右键获取它的图片链接

```
${imageSyntaxPrefix}https://github.com/learningNicolas/MarkdownImageRepertory/blob/master/${imageFilePath}?raw=true${imageSyntaxSuffix}
```

![](https://github.com/learningNicolas/MarkdownImageRepertory/blob/master/image/2019-03-22-15-09-21.png?raw=true)

> path 配置为 `${projectRoot}/image/`

![](https://github.com/learningNicolas/MarkdownImageRepertory/blob/master/image/2019-03-22-15-13-06.png?raw=true)


> 修改 paste 快捷键     首选项-> 键盘快捷方式

![](https://github.com/learningNicolas/MarkdownImageRepertory/blob/master/image/2019-03-22-15-14-41.png?raw=true)


### 建立GitHub仓库
> 由于篇幅所限，此处假定你已经建立好自己的图片仓库
在工程目录下，右键 `git bash here`

![](https://github.com/learningNicolas/MarkdownImageRepertory/blob/master/image/2019-03-22-15-18-39.png?raw=true)

```
git clone 仓库地址
```

> 常用命令
```
git add .
git commit -m "提交信息，可以随便打"
git push orign master
```

### git 脚本

> 项目根目录下创建 `push.sh`文件

输入以下代码：
```
# git 脚本

if [ $# -eq 0 ]
then
    msg='msg is null';
else
    msg=$1
fi

echo "执行git add 命令"
git add .
echo "执行git commit 命令"
git commit -m "$msg"
echo "执行git push 命令"
git push origin master

```

使用方式：右键打开git.bash，输入 `./push.sh "提交信息"`  回车运行即可。

![](https://github.com/learningNicolas/MarkdownImageRepertory/blob/master/image/2019-03-22-20-55-51.png?raw=true)


> 注意，脚本中 echo 后双引号会解析其中的变量， 而单引号不会。
