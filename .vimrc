call plug#begin('~/.vim/plugged')

Plug 'altercation/vim-colors-solarized'
Plug 'morhetz/gruvbox'
Plug 'mhinz/vim-startify'
Plug 'junegunn/vim-easy-align'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'editorconfig/editorconfig-vim'
Plug 'mattn/emmet-vim'
Plug 'majutsushi/tagbar'
Plug 'ludovicchabant/vim-gutentags'
Plug 'Yggdroot/indentLine'
Plug 'vim-ruby/vim-ruby'
Plug 'pangloss/vim-javascript'
Plug 'isRuslan/vim-es6'
Plug 'mxw/vim-jsx'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'Chiel92/vim-autoformat'
Plug 'dense-analysis/ale'
Plug 'ap/vim-css-color'
Plug 'tpope/vim-fugitive'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'brooth/far.vim'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'liuchengxu/vista.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

call plug#end()

set t_Co=256
set background=dark
colorscheme solarized
" colorscheme gruvbox

set nocompatible

" 修改leader键
let mapleader=','
let g:mapleader=','

set number
set cursorline
set showmode
" 在状态栏显示正在输入的命令
set showcmd
" 启用鼠标
set mouse=a
set textwidth=80
set wrap
set linebreak
set ruler
" 在上下移动光标时，光标的上方或下方至少会保留显示的行数
set scrolloff=8
set autochdir
set clipboard=unnamed
set updatetime=100

" 开启语法高亮
syntax enable
syntax on
" 检测文件类型
filetype on
" 针对不同的文件类型采用不同的缩进格式
filetype indent on
" 允许插件
filetype plugin on
" 启动自动补全
filetype plugin indent on

" 缩进
set autoindent
set tabstop=2
set backspace=2
set shiftwidth=2
set expandtab
set softtabstop=2

set showmatch
set hlsearch
set incsearch

set noerrorbells
set visualbell

set listchars=tab:»■,trail:■
set list

set wildmenu
set wildmode=longest:list,full
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

set nofoldenable
set foldmethod=syntax

imap <leader>w <Esc>:w!<CR>

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" map <Leader>f <Plug>(easymotion-prefix)
map <leader>/ <Plug>(easymotion-sn)

let g:indentLine_enabled    = 1
let g:indentLine_char       = '¦'
let g:indentLine_color_term = 239

" Ale check syntax
" 自定义error和warning图标
let g:ale_sign_error           = '💥'
let g:ale_sign_warning         = '⚡️'
" 在vim自带的状态栏中整合ale
let g:ale_statusline_format    = ['💥 %d', '⚡️ %d', '✔ OK']
" 显示Linter名称,出错或警告等相关信息
let g:ale_set_highlights       = 0
let g:ale_echo_msg_error_str   = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format      = '[%linter%] %s [%severity%]'

let g:ale_linters = {
      \   'c++': ['clang'],
      \   'c': ['clang'],
      \   'python': ['pylint'],
      \   'javascript': ['eslint'],
      \   'typescript': ['eslint']
      \}

let g:ale_fixers = {
      \   'javascript': ['eslint'],
      \   'typescript': ['eslint'],
      \   'less': ['stylelint'],
      \}

nmap <Leader>= <Plug>(ale_fix)
" let g:ale_fix_on_save = 1
nmap sp <Plug>(ale_previous_wrap)
nmap sn <Plug>(ale_next_wrap)
nmap <Leader>l :ALEToggle<CR>
nmap <Leader>d :ALEDetail<CR>
" 打开文件时不进行检查
" let g:ale_lint_on_enter = 0

let g:airline_theme='solarized'
" let g:airline_theme='gruvbox'

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = '\v\node_modules$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }

noremap <C-n> :NERDTreeToggle<CR>
noremap <leader>v :NERDTreeFind<CR>
let NERDTreeAutoCenter      = 1
let NERDTreeShowHidden      = 1
let NERDTreeWinSize         = 31
let NERDTreeIgnore          = ['\.git$','\.swp','.DS_Store']
let NERDTreeShowBookmarks   = 1

" 自动补全配置
set completeopt=menu,menuone    "让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0

nmap <C-t> :TagbarToggle<CR>
let g:vista_icon_indent = ['╰─▸ ', '├─▸ ']
let g:vista_default_executive = 'ctags'
let g:vista#renderer#enable_icon = 1
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }
let g:limelight_conceal_ctermfg = 240
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'
" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
let g:gutentags_ctags_extra_args += ['--js-kinds=+px']
let g:tagbar_type_typescript = {
    \ 'ctagstype' : 'typescript',
    \ 'kinds'     : [
      \ 'C:constant',
      \ 'G:generator',
      \ 'a:alias',
      \ 'c:class',
      \ 'e:enumerator',
      \ 'f:function',
      \ 'g:enum',
      \ 'i:interface',
      \ 'm:method',
      \ 'n:namespace',
      \ 'p:property',
      \ 'v:variable',
      \ 'z:parameter'
    \ ],
    \ 'sro'        : '.',
    \ 'kind2scope' : {
      \ 'C' : 'contant',
      \ 'c' : 'class'
    \ }
\ }
" 检测 ~/.cache/tags 不存在就新建
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif

" Quickly Run
map <leader>r :call CompileRunGcc()<CR>
func! CompileRunGcc()
  exec "w"
  if &filetype == 'c'
    exec "!g++ % -o %<"
    exec "!time ./%<"
  elseif &filetype == 'cpp'
    exec "!g++ % -o %<"
    exec "!time ./%<"
  elseif &filetype == 'java'
    exec "!javac %"
    exec "!time java %<"
  elseif &filetype == 'sh'
    :!time bash %
  elseif &filetype == 'python'
    exec "!time python %"
  elseif &filetype == 'html'
    exec "!firefox % &"
  elseif &filetype == 'go'
    exec "!go build %<"
    exec "!time go run %"
  elseif &filetype == 'mkd'
    exec "!~/.vim/markdown.pl % > %.html &"
    exec "!firefox %.html &"
  endif
endfunc

" Allow to trigger background
function! ToggleBG()
  let s:tbg = &background
  " Inversion
  if s:tbg == "dark"
    set background=light
  else
    set background=dark
  endif
endfunction
noremap <leader>bg :call ToggleBG()<CR>
