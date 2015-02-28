" Disable Vi compatibility
set nocompatible
colorscheme default

"set list
"set listchars=tab:.\
"set listchars+=trail:▸
"set listchars+=nbsp:_
"set listchars+=eol:¬

set textwidth=120
" set line number
set number
set autoread
set clipboard=unnamed
" Minimal number of screen lines to keep above and below the cursor.
set scrolloff=5
" allow some key to move accross line(loop just like a circle) ,b: <BS> " s:<SPACE>
set whichwrap=b,s,>,<,[,]
" turn off the error tip bell
set noerrorbells
" auto change current directory when execute ':vsp',':e' ,etc..
"set autochdir
" used for count of tab expand spaces(when type <tab> in 'i' mod w)
set tabstop=4
" used for count of tab expand spaces(when type << ,>>  in 'n' mod w)
set shiftwidth=4
set softtabstop=4
" set extra line break except for the \n and reaching end of line
set linebreak
" show the match pair
set showmatch
" autoindent let the next line(when type <cr> in the i mod) indent same as
" prev line
set autoindent
" autoindent more,such as 'if','else','{','}' will add one extra indent to next line 
set smartindent
set backspace=indent,eol,start

" set mouse=a
set guioptions+=a
set expandtab
set formatoptions=tq

set encoding=utf-8 nobomb
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set termencoding=utf-8
set langmenu=zh_CN.UTF-8
set laststatus=2
set cpt=.,w,b,k,i,t
language message zh_CN.UTF-8

let mapleader = ','

" 打开文件时自动跳到上一次的光标位置
autocmd BufReadPost *
            \ if line("'\"")>0&&line("'\"")<=line("$") |
            \ exe "normal g'\"" |
            \ endif

if has("cmdline_info")
    " Show the cursor line and column number
    set ruler
    " Show partial commands in status line
    set showcmd
    " Show whether in insert or replace mode
    set showmode
endif

if has("syntax")
    " Enable syntax highlighting
    syntax enable
    " Set 256 color terminal support
    set t_Co=256
    " Set dark background
    set background=dark
endif

if has('statusline')
    " Always show status line
    set laststatus=2
    " Broken down into easily includeable segments
    " Filename
    set statusline=%<%f
    " Options
    set statusline+=%w%h%m%r
    " Current dir
    set statusline+=\ [%{getcwd()}]
    " Right aligned file nav info
    set statusline+=%=%-14.(%l,%c%V%)\ %p%%
endif

if has("autocmd")
    " Load files for specific filetypes
    filetype on
    filetype indent on
    filetype plugin on
endif

if has("wildmenu")
    " Show a list of possible completions
    set wildmenu
    " Tab autocomplete longest possible part of a string,   then list
    set wildmode=longest,list
    if has ("wildignore")
        set wildignore+=*.a,*.pyc,*.o,*.orig
        set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png
        set wildignore+=.DS_Store,.git,.hg,.svn
        set wildignore+=*~,*.sw?,*.tmp
    endif
endif

if has("extra_search")
    " Highlight searches [use :noh to clear]
    set hlsearch
    " Highlight dynamically as pattern is typed
    set incsearch
    " Ignore case of searches...
    set ignorecase
    " unless has mixed case
    set smartcase
endif

" highlight current line
set cursorline
hi CursorLine cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
set colorcolumn=120
hi colorcolumn guifg=darkgreen

" 更新vimrc时另当前缓冲区全部重加载vimrc
autocmd! BufWritePost .vimrc source ~/.vimrc
autocmd filetype smarty,tpl let &l:filetype='html'
set keywordprg=:help
let s:vimfile = '~/.vim/'
" 多窗口时调整当前窗口的大小
nnoremap <Up> <C-w>10+
nnoremap <Down> <C-w>10-
nnoremap <Left> <C-w>10<
nnoremap <right> <C-w>10>
" 从minibuffer里面移植过来的
noremap <C-J> <C-W>j
noremap <C-K> <C-W>k
noremap <C-H> <C-W>h
noremap <C-L> <C-W>l
" 垂直切分某一个buffer,eg:Vb {1/2/3}
command! -nargs=1 -complete=file Vb execute("vertical split ".<f-args>)
command! -nargs=1 -complete=file Vd execute("vertical diffsplit ".<f-args>)
cmap w!! %!sudo tee > /dev/null %

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Bundle 'gmarik/Vundle.vim'

Bundle 'Emmet.vim'

Bundle 'kien/ctrlp.vim'
map <leader>p :CtrlP<CR>
map <leader>b :CtrlPBuffer<CR>
map <leader>t :CtrlPTag<CR>
let g:ctrlp_switch_buffer = 'Et'
let g:ctrlp_working_path_mode = 'rwa'
let g:ctrlp_open_new_file = 'h'
let g:ctrlp_match_window = 'order:ttb,min:1,max:10,results:20'
let g:ctrlp_root_markers = ['Bootstrap.php','fis-conf.js']
let g:ctrlp_max_files =0
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_extensions = ['tag', 'buffertag', 'quickfix', 'dir', 'rtscript', 'undo', 'line',
            \'changes', 'mixed', 'bookmarkdir','funky']

Bundle 'tacahiroy/ctrlp-funky',
map <leader>f :CtrlPFunky<CR>

" based on conceal feature
"Bundle 'Yggdroot/indentLine'
"let g:indentLine_char = '|'

Bundle 'Shougo/neocomplcache.vim'
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
            \ 'default' : '',
            \ 'vimshell' : $HOME.'/.vimshell_hist',
            \ 'scheme' : $HOME.'/.gosh_completions'
            \ }
" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
" Plugin key-mappings.
inoremap <expr><C-g> neocomplcache#undo_completion()
inoremap <expr><C-l> neocomplcache#complete_common_string()
" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    return neocomplcache#smart_close_popup() . "\<CR>"
    " For no inserting <CR> key.
    "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" <C-n>: completion.
inoremap <expr><C-n>  pumvisible() ? "\<C-n>" : "\<C-n>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
if !exists('g:neocomplcache_force_omni_patterns')
    let g:neocomplcache_force_omni_patterns = {}
endif
let g:neocomplcache_force_omni_patterns.php = '[^.]->\h\w*\|\h\w*::'
let g:neocomplcache_force_omni_patterns.c = '[^.[:digit:]*]\%(\.\|->\)'
let g:neocomplcache_force_omni_patterns.cpp = '[^.[:digit:]*]\%(\.\|->\)\|\h\w*::'
" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplcache_force_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

Bundle 'jlanzarotta/bufexplorer'
map <F3> :ToggleBufExplorer<CR>

Bundle 'scrooloose/nerdtree'
map <F2> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let g:NERDTreeQuitOnOpen=1
let g:NERDTreeShowHidden=1

Bundle 'taglist.vim'
let Tlist_Exit_OnlyWindow=1
map <F4> :TlistToggle<CR>

Bundle 'brookhong/cscope.vim'
map <F5> :!find . -iname '*.c' -o 
            \ -iname '*.cpp' -o 
            \ -iname '*.h' -o 
            \ -iname '*.php' -o 
            \ -iname '*.js' -o 
            \ > cscope.files<CR>
            \ :!cscope -Rbk cscope.files -f cscope.out<CR> 
            \ :cs reset<CR>

set cscopetag
if has("cscope")
    set csprg=/usr/local/bin/cscope
    nmap <leader><leader>c :cs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <leader><leader>d :cs find d <C-R>=expand("<cword>")<CR><CR>
    nmap <leader><leader>e :cs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <leader><leader>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <leader><leader>g :cs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <leader><leader>i :cs find i <C-R>=expand("<cfile>")<CR><CR>
    nmap <leader><leader>s :cs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <leader><leader>t :cs find t <C-R>=expand("<cword>")<CR><CR>
    "if filereadable("cscope.out")
        "cs add "cscope.out"
        "这里可以写绝对路径
    "endif
endif

Bundle "lykling/fecs.vim"

Bundle 'scrooloose/syntastic'
" npm install -g jshint for js syntax check
" npm install -g csslint for css syntax check
let g:syntastic_javascript_checkers=['fecs']
set statusline+=%#warningmsg#
if exists("*SyntasticStatuslineFlag")
    set statusline+=%{SyntasticStatuslineFlag()}
endif
set statusline+=%*
let g:syntastic_ignore_files=[".*\.py$"]
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_wq=0
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

"Bundle 'nathanaelkane/vim-indent-guides'
"let g:indent_guides_enable_on_vim_startup=1
"let g:indent_guides_guide_size=1
"let g:indent_guides_auto_colors=0
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4

"Bundle 'terryma/vim-multiple-cursors'
"let g:multi_cursor_use_default_mapping=0
"let g:multi_cursor_next_key='<C-1>'
"let g:multi_cursor_prev_key='<C-2>'
"let g:multi_cursor_skip_key='<C-3>'
"let g:multi_cursor_quit_key='<Esc>'

Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"
" Optional:
Bundle "honza/vim-snippets"
let g:UltiSnipsExpandTrigger="<TAB>"

Bundle "comments.vim"

Bundle "tomasr/molokai"
silent! colorscheme molokai

Bundle 'Valloric/MatchTagAlways'

Bundle "lmule/vim-var_dump"

Bundle "jiangmiao/auto-pairs"

call vundle#end()
if filereadable(expand("~/.vimrc.local"))
    source ~/.vimrc.local
endif
