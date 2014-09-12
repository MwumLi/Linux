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

" 转化编码的插件  
Plugin 'MwumLi/fencview'

" IDE的配置  
" 标签浏览器
Plugin 'vim-scripts/taglist.vim'

" 窗口管理器  
Plugin 'MwumLi/WinManager'

" 缓冲区管理器
Plugin 'vim-scripts/minibufexpl.vim'

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

" taglist配置  
let Tlist_Ctags_Cmd='ctags'	"taglist依赖于ctags.设置ctags位置  
let Tlist_Use_Right_Window=0	"窗口显示位置:0(左边) 1(右边)
let Tlist_Show_One_File=1	"显示文件个数:0(多个) 1(一个)
"非当前文件，函数列表折叠隐藏  
let Tlist_File_Fold_Auto_Close=1 
"打开taglist光标停留在taglist窗口
let Tlist_GainFocus_On_ToggleOpen=1 
" 当taglist是最后一个分割窗口时，自动退出vim
let Tlist_Exit_OnlyWindow=1
let Tlist_Process_File_Always=1	"实施更新tags:1(是)0(否)  
let Tlist_Inc_Winwidth=0  
nmap tl :Tlist<CR>		"按下tl打开标签浏览器

" 按下<F5>生成tags,并且更新taglist
map <F5> :!ctags -R --c++-kinds=+p --fields=+ialS --extra=+q .<CR><CR> :TlistUpdate<CR>
set tags=./tags

" WinManager配置  
" 设置要管理的插件
let g:winManagerWindowLayout='FileExplorer,TagList' 
" 如果所有编辑文件都关闭了，退出vim
let g:persistentBehaviour=0 
let g:defaultExplorer=1
let g:winManagerWidth=25
nmap wm :WMToggle<cr>

"minibufexpl配置  
" 按下Ctrl+h/j/k/l，可以切换到当前>窗口的上下左右窗口
let g:miniBufExplMapWindowNavVim = 1    
" 按下Ctrl+arrow，可以切换到当前窗口的上下左右窗口
let g:miniBufExplMapWindowNavArrows = 1 
" 不要在不可编辑内容的窗口（如TagList窗口）中打开选中的buffer
let g:miniBufExplModSelTarget = 1       "


