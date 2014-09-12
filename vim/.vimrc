set nocompatible	"be iMproved, required
filetype off		"required

" 开始Vundle的管理
" set the runtime path to include Vundle and initialize 
 set rtp+=~/.vim/bundle/Vundle 
 call vundle#begin()

 " Vundle自身管理自己,rquired
 Plugin 'gmarik/Vundle.vim'

 call vundle#end()			"required 
 filetype plugin indent on	"required
