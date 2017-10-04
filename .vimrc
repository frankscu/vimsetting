set nocompatible "不兼容vi模式
filetype on	"文件类型侦测
filetype plugin on
filetype plugin indent on
syntax enable	"语法高亮
set background=dark
colorscheme molokai
set laststatus=2
hi Cursorline cterm=NONE ctermbg=black
set guifont="Inconsolata for Powerline":h17
set number "显示行号
set cursorline "突出当前行
set hlsearch
set fo+=mB "对亚洲语言断行支持
set ignorecase " 搜索时大小写不敏感
set wildmenu " vim 自身命令行模式智能补全

"-----------------------------------------
" Coding setting
"-----------------------------------------
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936,utf-16,big5,euc-jp,latin1

"-----------------------------------------
" Tab Setting
"-----------------------------------------
set smarttab
set tabstop=4
set shiftwidth=4
set expandtab

"-----------------------------------------
" Vundle
" ----------------------------------------
"'''''''''''''''''''''''''''''''''''''
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"'''''''''''''''''''''''''''''''''''''''
Plugin 'VundlerVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'vim-scripts/taglist.vim'
Plugin 'majutsushi/tagbar'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'klen/python-mode'
Plugin 'junegunn/fzf'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Yggdroot/indentLine'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'Valloric/YouCompleteMe'
if has('nvim')
    Plugin 'roxma/nvim-completion-manager'
    Plugin 'Shougo/neco-vim'
endif
call vundle#end()
"''''''''''''''''''''''''''''''''''''

"-----------------------------------------
" rainbow 
" ----------------------------------------
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

"-----------------------------------------
" Tagbar
" ----------------------------------------
nmap <silent><F4> :TagbarToggle<CR>
let g:tagbar_ctags_bin = 'ctags'
let g:tagbar_width = 30

"-----------------------------------------
" airline
" ----------------------------------------
let g:airline_theme="molokai"
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symnols = {}
endif
let g:airline_symnols.space = "\ua0"

" airline symbols
if !exists('g:airline_powerline_fonts')
    let g:airline_left_sep = '>'
    let g:airline_right_sep = '<'
endif

"-----------------------------------------
"" for error highlight，防止错误整行标红导致看不清
"-----------------------------------------
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline

"-----------------------------------------
"" NERDTree
"-----------------------------------------
nmap <F1> :NERDTreeToggle<cr>

"-----------------------------------------
"" Python mode 
"-----------------------------------------
let g:pymode_rope = 1

" Documentation
let g:pymode_doc = 1
" Override view python doc key shortcut to Ctrl-Shift-d
let g:pymode_doc_bind = "<C-S-d>"

"Linting
let g:pymode_lint = 0
let g:pymode_lint_checker = "pyflakes,pep8"
" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0

" Trun off autocompletion when typing a period
let g:pymode_rope_complete_on_dot = 0

"-----------------------------------------
" Indent line
"-----------------------------------------
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#A4E57E'
let g:indentLine_indentLevel = 2

"-----------------------------------------
" Latex 
"-----------------------------------------
let g:tex_conceal = ""

"-----------------------------------------
" VIM command line to EMACS mode
"-----------------------------------------
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>

"-----------------------------------------
" Vim environment save
"-----------------------------------------
"第一步，保存所有文档：
":wa

"第二步，借助 viminfo 和 session 保存当前环境：
":mksession! my.vim
":wviminfo! my.viminfo

"第三步，退出 vim：
":qa

"第四步，恢复环境，进入 vim 后执行：
":source my.vim
":rviminfo my.viminfo  
"

"-----------------------------------------
" Vim markdown 
"-----------------------------------------
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_folding_style_pythonic = 1
let g:vim_markdown_override_foldtext = 0
let g:vim_markdown_conceal = 0
let g:vim_markdown_toc_autofit = 1
let g:tex_conceal = ""
let g:vim_markdown_math = 1



"=========================================
"=========================================
if has('nvim')
    "-----------------------------------------
    " NeoVim bash
    "-----------------------------------------
    tnoremap <Esc> <C-\><C-n>
    nmap <F2> :bo sp term://zsh\|resize 5<CR>i
    
    "-----------------------------------------
    " NeoVim complete 
    "-----------------------------------------
    " for python completions
    let g:python_support_python3_requirements = add(get(g:,'python_support_python3_requirements',[]),'jedi')
    " language specific completions on markdown file
    let g:python_support_python3_requirements = add(get(g:,'python_support_python3_requirements',[]),'mistune')

    " utils, optional
    let g:python_support_python3_requirements = add(get(g:,'python_support_python3_requirements',[]),'psutil')
    let g:python_support_python3_requirements = add(get(g:,'python_support_python3_requirements',[]),'setproctitle')

endif
"=========================================
