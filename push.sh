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
git commit -m '$msg'
echo "执行git push 命令"
git push origin master
