#!/bin/bash 

# 更新软件源
#sudo apt-get update 
# 安装基本编译环境  
sudo apt-get install build-essential
# vim install
sudo apt-get install vim vim-gtk
# 安装ctags
sudo apt-get install ctags
# 安装vim-doc vim-scripts
sudo apt-get install vim-doc vim-scripts
# 安装git
sudo apt-get install git
# 安装tree
sudo apt-get install tree
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

# 修改终端配色  
bg_color="#07242E"
fg_color="#708284"
gtk3_path="/usr/share/themes/Ambiance/gtk-3.0/apps/gnome-terminal.css"
gtk2_path="/usr/share/themes/Ambiance/gtk-2.0/apps/gnome-terminal.rc"
sudo sed "5s/#[a-zA-Z0-9]\+/${bg_color}/" -i ${gtk3_path}
sudo sed "7s/#[a-zA-Z0-9]\+/${fg_color}/" -i ${gtk3_path}
sudo sed "36s/#[a-zA-Z0-9]\+/${bg_color}/" -i ${gtk2_path}
sudo sed "37s/#[a-zA-Z0-9]\+/${fg_color}/" -i ${gtk2_path}
echo "终端配色修改完成，重启或注销后生效"


exit 0






