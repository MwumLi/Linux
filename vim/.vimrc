set nocompatible	"be iMproved, required
filetype off		"required

" 开始Vundle的管理
" set the runtime path to include Vundle and initialize 
set rtp+=~/.vim/bundle/Vundle.vim 
call vundle#begin()

" Vundle自身管理自己,rquired
Plugin 'gmarik/Vundle.vim'

" 一款增强vim状态栏的插件
Plugin 'Lokaltog/vim-powerline'

" Markdown插件  
Plugin 'plasticboy/vim-markdown'

call vundle#end()			"required 
filetype plugin indent on	"required
" Vundle配置结束

" 使.vimrc配置生效
nmap ,s :source $HOME/.vimrc<cr>

" 插入当前时间  
nmap ,d "=strftime("%Y-%m-%d %H:%M:%S")<CR>p

" 显示/隐藏行号
let s:num=1
function! Set_Num()
        if exists("s:num")
                set number
                unlet s:num
        else
                set nonumber
                let s:num=1
        endif
endfunction
nmap ,n :call Set_Num()<CR>

" 显示/隐藏行光标线
let s:row=1
function! Set_CursorLine()
        if exists("s:row")
                set cursorline
                unlet s:row
        else
                set nocursorline
                let s:row=1
        endif
endfunction
nmap ,r :call Set_CursorLine()<CR>

" 显示/隐藏列光标线
let s:column=1
function! Set_CursorColumn()
        if exists("s:column")
                set cursorcolumn
                unlet s:column
        else
                set nocursorcolumn
                let s:column=1
        endif
endfunction
nmap ,c :call Set_CursorColumn()<CR>


" Vundle管理的插件的配置  
" powerline配置  
set laststatus=2
set t_Co=256
let g:Powerline_symbols = 'unicode'
set encoding=utf8

" Markdown配置  
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_initial_foldlevel=1
au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} set filetype=mkd



