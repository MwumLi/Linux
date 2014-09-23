set nocompatible	"be iMproved, required
filetype off		"required

" ********************开始Vundle的管理***************************
" set the runtime path to include Vundle and initialize 
set rtp+=~/.vim/bundle/Vundle.vim 
call vundle#begin()

" Vundle自身管理自己,rquired
Plugin 'gmarik/Vundle.vim'

"l9 is a Vim-script library, 
"which provides some utility functions and commands
"for programming in Vim.
Plugin 'vim-scripts/L9'

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

"Web环境  
" css颜色预览
Plugin 'gorodinskiy/vim-coloresque'
"Plugin 'othree/html5.vim'
Plugin 'rkumar/html.vim'

" 头文件和源码切换  
Plugin 'vim-scripts/a.vim'

" 补全插件
Plugin 'vim-scripts/OmniCppComplete'
" 终极补全插件 
Plugin 'Shougo/neocomplete.vim'
" 插入代码片段，辅助neocomplete
Plugin 'Shougo/neosnippet.vim'
" 一些代码片段仓库 for neosnippet
Plugin 'Shougo/neosnippet-snippets'
" 一些代码仓库 
Plugin 'honza/vim-snippets'

" 语义分析
Plugin 'scrooloose/syntastic'

call vundle#end()			"required 
filetype plugin indent on	"required
" *****************Vundle配置结束******************

" *****************一些自定义*********************

set ruler
" 颜色主题 
colorscheme molokai

" 使.vimrc配置生效
nmap ,s :source $HOME/.vimrc<cr>

" 插入当前时间  
nmap ,d "=strftime("%Y-%m-%d %H:%M:%S")<CR>p

" 打开标签页面的个数
set tabpagemax=5
" 显示标签也:不显示(0),创建后显示(1),总是显示标签栏(2)
set showtabline=1

" 一些缩进设置  
set cindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set cinoptions={0,1s,t0,n-2,p2s,(03s,=.5s,>1s,=1s,:1s
"set noexpandtab / expandtab
set noexpandtab
set list
set listchars=tab:▸\ ,eol:¬

" 关于折叠  
set foldmethod=syntax
set foldlevel=100	"关闭所有折叠(0),一些折叠关闭(正数),不折叠(很大)
set foldcolumn=1	"0--12
set noshowmode		"命令行不显示vim模式  
"set mouse=a			"Enabl mouse 
set foldopen=all	"光标所在自动打开折叠
set foldclose=all	"光标移开自动关闭折叠

" QuickFix设置  
" 按下F6,执行make,并打开quickfix窗口，显示编译信息 
map <F6> :make<CR><CR><CR> :copen<CR><CR> 
" 按下<F7>,执行make clean  
map <F7> :make clean<CR><CR><CR>
" 按下<F8>,光标移到上一个错误所在行  
map <F8> :cp<CR>
" 按下<F9>,光标移到下一个错误所在行  
map <F9> :cn<CR>

" 关闭窗口
" 关闭quickfix窗口  
map cc :cclose<CR>
" 关闭预览窗口  
map pc :pclose<CR>


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


" 显示中文/英文帮助  
let s:lang=1
set helplang=cn 
function! Set_Help()
	if exists("s:lang")
		set helplang=en 
		unlet s:lang
	else
		set helplang=cn 
		let s:lang=1
	endif
endfunction

nmap ,h :call Set_Help()<CR>

"********************Vundle管理的插件的配置**************************
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
set tags +=/usr/include/tags 	
set tags +=/usr/include/c++/tags 
set tags +=./tags

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
let g:miniBufExplModSelTarget = 1       

"禁用tab选项
let g:no_html_tab_mapping = 'yes'

" a.vim的配置
inoremap <F10> <ESC>:A<CR>
noremap <F10>  :A<CR>  
"omnicppcomplete配置
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1 
let OmniCpp_ShowPrototypeInAbbr = 1 " 显示函数参数列表 
let OmniCpp_MayCompleteDot = 1   " 输入 .  后自动补全
let OmniCpp_MayCompleteArrow = 1 " 输入 -> 后自动补全 
let OmniCpp_MayCompleteScope = 1 " 输入 :: 后自动补全 
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" 自动关闭补全窗口 
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif 
set completeopt=menuone,menu,longest

"neocomplete配置  
" Use neocomplete
let g:neocomplete#enable_at_startup = 1
" use smartcase
let g:neocomplete#enable_smart_case = 1
" use camelcase
let g:neocomplete#enable_camel_case = 1
" Set minimum syntax keyword length
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neoODcomplete#cancel_popup()
" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" Neosnippet配置  
" 增强tab键用于插入代码片段
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets/' 



