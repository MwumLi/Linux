#!/bin/bash 

error=0
# create~/.vim/bundle
mkdir -p ~/.vim/bundle 
error=$?
if [ $error -eq 1 ] || [ $error -eq 0 ]; then 
	
	echo "~/.vim/bundle 已存在"
	# clone plugin Vundle into ~/bundle/
	git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim 2>/dev/null
	error=$?
	if [ $error -eq 0 ] || [ $error -eq 128 ]; then 
		echo "Vim管理插件Vundle安装成功"
	else
		echo "Vim管理插件Vundle安装失败"
		echo "退出安装"
		exit 1
	fi
else
	echo "~/.vim/bundle 创建失败"
fi 


# build vim config file
cp ./.vimrc ~/.vimrc 
if [ $? -eq 0 ]; then 
	echo "vim配置文件.Vimrc安装完毕"
else
	echo "vim配置文件.Vimrc安装失败"
	echo "退出安装"
	exit 2
fi

# build vim colorschem
# create ~/.vim/colors
mkdir -p ~/.vim/colors 
error=$?
if [ $error -eq 1 ] || [ $error -eq 0 ];then 
	cp ./colors/molokai.vim ~/.vim/colors/ 
	if [ $? -eq 0 ]; then 
		echo "配色方案构建成功"
		echo "如果你不喜欢，请你使用colorschem自定义"
		echo "Linux内建scheme位于:/usr/share/vim/vim74/colors"
	else
		echo "配色方案构建失败"  
	fi
else
	echo "~/.vim/colors 创建成功"
fi

# create ~/.vim/doc 
if mkdir -p ~/.vim/doc >/dev/null ; then 
	echo "~/.vim/doc 已存在"
else
	echo "~/.vim/doc 创建成功"
fi


# create ~/.vim/plugin 
if mkdir -p ~/.vim/plugin >/dev/null ; then 
	echo "~/.vim/plugin 已存在"
else
	echo "~/.vim/plugin 创建成功"
fi

# create ~/.vim/syntax 
if mkdir -p ~/.vim/syntax >/dev/null ; then 
	echo "~/.vim/syntax 已存在"
else
	echo "~/.vim/syntax 创建成功"
fi

# create ~/.vim/autoload
if mkdir -p ~/.vim/autoload >/dev/null ; then 
	echo "~/.vim/autoload 已存在"
else
	echo "~/.vim/autoload 创建成功"
fi

# create ~/.vim/ftplugin
if mkdir -p ~/.vim/ftplugin >/dev/null ; then 
	echo "~/.vim/ftplugin 已存在"
else
	echo "~/.vim/ftplugin 创建成功"
fi
# build simplified Chinese help document
tar -xvf ./vimcdoc-1.9.0.tar.gz && cd vimcdoc-1.9.0 && ./vimcdoc.sh -I
if [ $? -eq 0 ] ; then 
	echo "中文帮助文档建立完毕"
	echo "你可以在vim中通过',h'开启中文/英文文档"
else
	echo "中文帮助文档建立失败"
fi
# delete simplifie chinese doc
cd -
rm -r ./vimcdoc-1.9.0

echo "至此，vim 配置完毕，请你在首次进入vim，切换到command模式"
echo "输入PluginInstall"
echo "等待命令行出现done!的字样，那么，恭喜你了，可以使用vim了"  

exit 0
