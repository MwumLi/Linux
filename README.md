Linux
=====

My configuration for Linux ( mostly Ubuntu )

目前使用版本: `Ubuntu 14.04 64bits`
文档中为了方便，把项目根目录用`/`表示  
但是请根据具体情况自行领悟`/`的实际意义  
## Function
1. 安装了基本编译环境，包括gcc,g++等  

2. 安装了代码管理工具git  

3. 安装ctags--Linux下的一个标签生成器,并使用其生成基本头文件的tags,内置的vim配置文件指定了这些tags  

4. Vim的安装和配置  
安装了vim和vim-gtk,安装vim-gtk是为了开启某些功能,比如+balloon_eval  
请在脚本运行结束，打开vim命令行模式,然后键入:  

		:PluginInstall
以便完成vim插件的安装  

5. 终端配色修改，只需修改`/config.sh`中`bg_color`和`fg_color`,分别改变背景颜色和默认前景色  

6. 安装工具tree，用来查看目录树  
