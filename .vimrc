" be iMproved, required
set nocompatible
" set line number
set tw=100
set nu
" show the line and column number at the right down corner of the status bar;
set ruler
" Minimal number of screen lines to keep above and below the cursor.
set so=5 
" ignore lowercase and uppercase when execute ':s' , '*' ,etc...
set ignorecase
" allow some key to move accross line(loop just like a circle) ,b: <BS> " s:<SPACE>
set whichwrap=b,s,>,<,[,]
" turn off the error tip bell
set noerrorbells
" auto change current directory when execute ':vsp',':e' ,etc..
set autochdir
" used for count of tab expand spaces(when type <tab> in 'i' mod w)
set tabstop=4
" used for count of tab expand spaces(when type << ,>>  in 'n' mod w)
set shiftwidth=4
" set extra line break except for the \n and reaching end of line
set linebreak
" show the match pair
set showmatch
" autoindent let the next line(when type <cr> in the i mod) indent same as
" prev line
"set autoindent
" autoindent more,such as 'if','else','{','}' will add one extra indent to next line 
"set smartindent
" print cmd info
set showcmd
" highlight *
set hlsearch
" open realtime search
set incsearch
set backspace=indent,eol,start
" commend line auto completion in c mod
set wildmenu

"set mouse=a
set guioptions+=a
set expandtab
set fo=tq

set encoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
"set termencoding=gbk
set termencoding=utf-8
set langmenu=zh_CN.UTF-8
set laststatus=2
set cpt=.,w,b,k,i,t
language message zh_CN.UTF-8

syntax enable
filetype on  
filetype plugin indent on
"设置cword扩展'-'

"autocmd filetype vim setl iskeyword+=-,.,$,:
autocmd filetype smarty,html,css,javascript setl iskeyword+=-
"autocmd filetype php setl iskeyword+=$
autocmd filetype * setl fo=tq

nnoremap <F1> K
nnoremap <F5> :silent! cn<cr>\|:lne<cr>
nnoremap <F6> :silent! cp<cr>\|:lp<cr>
nnoremap <F7> :silent! cw<cr>\|:lw<cr>
nnoremap <F8> :silent! ccl<cr>\|:lcl<cr>
nnoremap <F9> <C-O>
nnoremap <F10> <C-I>
nnoremap <F11> :qa!<cr>
"nnoremap <F12> :WMToggle<cr>
nnoremap <F12> :NERDTreeToggle<cr>
"多窗口时调整当前窗口的大小
nnoremap <Up> <C-w>10+
nnoremap <Down> <C-w>10-
nnoremap <Left> <C-w>10<
nnoremap <right> <C-w>10>
" 从minibuffer里面移植过来的
noremap <C-J> <C-W>j
noremap <C-K> <C-W>k
noremap <C-H> <C-W>h
noremap <C-L> <C-W>l
noremap <C-N> :NERDTreeFocus<cr>
" 跳转当前光标至上一次驻留的窗口
nnoremap <Tab> <C-w><C-p>
"对应于 'J'命令的合并俩行，'K'用于拆分一行
nnoremap K i<cr><esc>
" extra paste for combining comand: 'y$' + <c-p>
nnoremap <C-p> o<space><esc><S-p>
" 关闭最近打开的窗口
nnoremap <c-c> :bun#<CR>
" 打开最近关闭的窗口
nnoremap <c-o> :vs#<CR>
" 取消当前操作并保存
nnoremap <C-u> u:w<CR>
" 恢复操作并保存
nnoremap <C-r> <C-r>:w<CR>
nnoremap <C-s> :w<CR>
" 垂直切分某一个buffer,eg:Vb {1/2/3}
command! -nargs=1 -complete=buffer Vb execute("vertical sb ".<f-args>)
command! -nargs=1 -complete=file Vd execute("vertical diffsplit ".<f-args>)

let g:ctrlp_map = '<leader>f'
nnoremap <leader>p :CtrlP 
nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>t :CtrlPTag<CR>
nnoremap <leader>m :CtrlPMRU<CR>
nnoremap <leader>d :CtrlPDir<CR>
nnoremap <leader>l :CtrlPLine<CR>
let g:ctrlp_extensions = ['tag', 'buffertag', 'quickfix', 'dir', 'rtscript', 'undo', 'line',
            \'changes', 'mixed', 'bookmarkdir','funky']

" taglist args
"let Tlist_Use_LEFT_Window=1
"let Tlist_File_Fold_Auto_Close=1
"let Tlist_Show_One_File=1
"let Tlist_GainFocus_On_ToggleOpen=1
"let Tlist_Exit_OnlyWindow=1
let NERDTreeShowBookmarks=1
let NERDTreeDirArrows=0

" winmanager args
"let g:winManagerWindowLayout='FileExplorer|TagList'
"let g:NERDTree_title = "[NERDTree]"
"function! NERDTree_Start() 
"
"	exe 'NERDTree'
"
"endfunction 
"
"function! NERDTree_IsValid() 
"
"	return 1 
"
"endfunction
"let g:winManagerWindowLayout='NERDTree'
"let g:miniBufExplMapCTabSwitchBufs = 1
"let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplMapWindowNavArrows = 1
"let g:miniBufExplorerMoreThanOne=0

" set the runtime path to include Vundle and initialize
let s:MSWIN =   has("win16") || has("win32") || has("win64") || has("win95")
if	s:MSWIN
	autocmd! BufWritePost _vimrc source $VIM/_vimrc
	source $VIMRUNTIME/menu.vim
	set rtp+=$VIM/vimfiles/bundle/Vundle.vim/
	"set shell=C:\msys\1.0\bin\sh.exe
	"set shellcmdflag=-c
	let path=$VIM."/vimfiles/bundle"
	" alternatively, pass a path where Vundle should install plugins
	" call vundle#begin('~/some/path/here')
	let s:vimfile = $vim.'/vimfiles/'
	call vundle#begin(path)
else
	set t_Co=256
	"更新vimrc时另当前缓冲区全部重加载vimrc
	autocmd! BufWritePost .vimrc source ~/.vimrc
	set rtp+=~/.vim/bundle/vundle/
	set keywordprg=:help
	let s:vimfile = '~/.vim/'
	call vundle#begin()
endif
set colorcolumn=80
"设置列的背景色
autocmd! filetype * hi ColorColumn ctermbg=darkred
Bundle 'gmarik/Vundle.vim',
"Bundle 'wincent/command-t',
Bundle 'xolox/vim-misc',
Bundle 'xolox/vim-easytags',
Bundle 'jsbeautify',
Bundle 'Emmet.vim',
Bundle 'matchit.zip',
Bundle 'winmanager',
Bundle 'taglist.vim',
"Bundle 'cscope.vim',
Bundle 'git@github.com:lmule/vim-cscope.git'
Bundle 'garbas/vim-snipmate',
Bundle "MarcWeber/vim-addon-mw-utils",
"Bundle "tomtom/tlib_vim",
Bundle 'snipmate-snippets',
"Bundle 'comments.vim',
Bundle 'git@github.com:lmule/vim-comments.git'
"Bundle 'minibufexpl.vim',
Bundle 'bolasblack/gtrans.vim',
Bundle 'ornicar/vim-php-doc',
"Bundle 'var_dump.vim',
Bundle 'git@github.com:lmule/vim-var_dump.git',
Bundle 'bling/vim-airline',
Bundle 'asins/vim-dict',
Bundle 'scrooloose/nerdtree',
Bundle 'nanotech/jellybeans.vim',
Bundle 'kien/ctrlp.vim',
Bundle 'ivalkeen/vim-ctrlp-tjump',
Bundle 'tacahiroy/ctrlp-funky',
Bundle 'bufonly'
Bundle 'CmdlineComplete'
Bundle 'AutoComplPop',
"Bundle 'Valloric/YouCompleteMe',
"Bundle 'phpcomplete.vim'
"Bundle 'pangloss/vim-javascript'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'scrooloose/syntastic'
Bundle 'Valloric/MatchTagAlways'
call vundle#end()
autocmd filetype * let &l:dict=s:vimfile.'bundle/vim-dict/dict/'.&ft.'.dict'
autocmd filetype smarty,tpl let &l:filetype='html'
" convert tpl file's filetype to html
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline_section_c='%F'
let g:airline_inactive_collapse=0
let g:SimpleJsIndenter_BriefMode=1
let g:ctrlp_switch_buffer = 'Et'
let g:ctrlp_working_path_mode = 'rwa'
let g:ctrlp_open_new_file = 'h'
let g:ctrlp_match_window = 'order:ttb,min:1,max:10,results:20'
let g:ctrlp_root_markers = ['Bootstrap.php','fis-conf.js']
let g:ctrlp_max_files =0
let g:ctrlp_clear_cache_on_exit = 0
let g:ycm_key_list_select_completion = ['<c-j>']
let g:ycm_key_list_previous_completion = ['<c-k>']
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_key_invoke_completion = '<C-f>'
let g:syntastic_check_on_open = 1
let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
let g:syntastic_enable_balloons = 1
let g:syntastic_loc_list_height = 5
autocmd filetype tpl,html let b:match_words = '<:>,'.
            \ '<\@<=[ou]l\>[^>]*\%(>\|$\):<\@<=li\>:<\@<=/[ou]l>,' .
            \ '<\@<=dl\>[^>]*\%(>\|$\):<\@<=d[td]\>:<\@<=/dl>,' .
            \ '<\@<=\([^/][^ \t>]*\)[^>]*\%(>\|$\):<\@<=/\1>,'  .
            \ '{%if.*%}:{%else.*%}:{%/if%},'.
            \ '{%for.*%}:{%/for.*%},'.
            \ '{%widget.*%}:{%/widget%},'.
            \ '{%block.*%}:{%/block%}'
" 分语言的lint 工具配置:
"let g:syntastic_javascript_checkers=['eslint']
"let g:acp_enableAtStartup = 0
" All of your Plugins must be added before the following line
"hi Pmenusel ctermbg='white'
"hi search ctermbg=25
