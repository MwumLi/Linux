#!/bin/bash 

# 更新软件源
sudo apt-get update 
# 安装基本编译环境  
sudo apt-get install build-essential
# vim install
sudo apt-get install vim vim-gtk
# 安装ctags
sudo apt-get install ctags
# 安装git
sudo apt-get install git
# 下载Vundle到~/.vim/bundle/Vundle.vim
mkdir -p ~/.vim/bundle/ &&
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# 生成基本头文件的tags
cd /usr/include/ && sudo ctags ./*.h && cd - && cd /usr/include/c++/ && sudo ctags -R --c++-kinds=+p --fields=+ialS --extra=+q . && cd -

# 配置vim
cd ./vim
/bin/bash ./config.sh
if [ $? -eq 0 ]; then 
	echo "Vim配置成功"
else
	echo "vim配置失败"
fi
cd -

exit 0






