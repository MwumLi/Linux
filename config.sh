#!/bin/bash 

# 更新软件源
sudo apt-get update 
# n安装基本编译环境  
sudo apt-get install build-essential
# 安装ctags
sudo apt-get install ctags
# 安装git
sudo apt-get install git
# 下载Vundle到~/.vim/bundle/Vundle.vim
mkdir -p ~/.vim/bundle/ &&
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# vim配色插件
mkdir -p ~/.vim/colors &&
cp vim/colors/molokai.vim ~/.vim/colors/

# 生成基本头文件的tags
cd /usr/include/ && sudo ctags ./*.h && cd - && cd /usr/include/c++/ && sudo ctags -R --c++-kinds=+p --fields=+ialS --extra=+q . && cd -

cp vim/.vimrc ~/.vimrc		#移动.vimrc到你的home目录
# 安装vim
sudo apt-get install vim vim-gtk




