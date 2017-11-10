set nocompatible "vi forbidden
filetype on	
filetype plugin on
filetype plugin indent on
syntax enable	
set background=dark
if has('nvim')
    colorscheme gruvbox
else
    let g:gruvbox_contrast_dark='medium'
    colorscheme molokai
endif

set number 
set hlsearch
set fo+=mB "Asian Language Support
set ignorecase " ignore Cap Letters in search 
set wildmenu " vim command complete
set clipboard=unnamed " System clipboard

set laststatus=2
set cursorline 
set cursorcolumn
hi Cursorline cterm=NONE ctermbg=black
hi CursorColumn cterm=NONE ctermbg=black
set guifont="Inconsolata for Powerline":h17
if has("gui_running")
    let s:uname=system("uname")
    if s:uname=="Darwin\n"
        set guifont=Inconsolata\ for\ Powerline:h17
    endif 
endif

"-----------------------------------------
" Coding setting
"-----------------------------------------
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936,utf-16,big5,euc-jp,latin1

"-----------------------------------------
" Tab Setting
"-----------------------------------------
set smarttab
set tabstop=2
set shiftwidth=2
set expandtab

"-----------------------------------------
" Vundle
" ----------------------------------------
"'''''''''''''''''''''''''''''''''''''
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"'''''''''''''''''''''''''''''''''''''''
Plugin 'VundlerVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'vim-scripts/taglist.vim'
Plugin 'majutsushi/tagbar'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'klen/python-mode'
" Search 
Plugin 'rking/ag.vim'
Plugin 'Yggdroot/LeaderF'
" File manager
Plugin 'scrooloose/nerdtree'
" Comment
Plugin 'scrooloose/nerdcommenter'
" Indent line
Plugin 'Yggdroot/indentLine'
" Align
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'Valloric/YouCompleteMe'
" C++ highlight
Plugin 'octol/vim-cpp-enhanced-highlight'
" CERN ROOT highlight
Plugin 'parnmatt/vim-root'
Plugin 'frankscu/vim-geant4-syntax'
" Pinyin
Plugin 'CodeFalling/fcitx-vim-osx'
" Rename
Plugin 'qpkorr/vim-renamer'
Plugin 'Raimondi/delimitMate'
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
" YouCompleteMe
" ----------------------------------------
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_global_ycm_extra_conf = '~/.vim/data/ycm/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_seed_identifiers_with_syntax = 0
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_filetype_blacklist = {
            \ 'tagbar' : 1,
            \ 'nerdtree' : 1,
            \}
" syntax check option
let g:ycm_show_diagnostics_ui = 0

"-----------------------------------------
" airline
" ----------------------------------------
if has('nvim')
    let g:airline_theme="gruvbox"
else
    let g:airline_theme="molokai"
endif
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

let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>+ <Plug>AirlineSelectNextTab

"-----------------------------------------
"" ag  search 
"-----------------------------------------
nnoremap <C-f> :Ag<Space>
nnoremap <C-s> :LeaderfFile<cr>

"-----------------------------------------
"" for error highlight
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
" VIM command line to EMACS mode
"-----------------------------------------
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>

"-----------------------------------------
" NERDCommenter
"-----------------------------------------
let g:NERDSpaceDelims=1


"-----------------------------------------
" split navigations
"-----------------------------------------
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

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

"-----------------------------------------
" vim-cpp-enhanced-highlight
"-----------------------------------------
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_concepts_highlight = 1
let g:cpp_experimental_simple_template_highlights = 1

"-----------------------------------------
" CERN ROOT highlight
"-----------------------------------------
autocmd BufNewFile,BufRead *.c,*.cpp,*.cc set syntax+=.root
autocmd BufNewFile,BufRead *.c,*.cpp,*.cc set syntax+=.geant4

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
