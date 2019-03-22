# git 脚本

if [ $1 != '' ]
then
    msg=$1
else
    msg='msg is null';
fi

echo "执行git add 命令"
git add .
echo "执行git commit 命令"
git commit -m '$msg'
echo "执行git push 命令"
git push origin master
