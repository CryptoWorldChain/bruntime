#/bin/bash
#
# Copyright CWV Corp All Rights Reserved
#
# 打包all
git pull
rm -rf ../shell/cwv-package/bruntime.tar.gz
tar -zcvf ../shell/cwv-package/bruntime.tar.gz modules conf keystore clib genesis
echo 'bruntime.tar.gz successed...'
sleep 1
# git 获取增量包
# rm -rf ../shell-data/cwv-package/bruntime-bruntime-incremet.tar.gz
# git archive --format=tar.gz -o ../shell-data/cwv-package/bruntime-increment.tar.gz HEAD $(git diff --name-only HEAD^)
# echo 'bruntime-increment.tar.gz successed...'
