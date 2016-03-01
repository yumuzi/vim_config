" 配置Vundle

set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=$HOME/vimfiles/bundle/Vundle.vim
call vundle#begin('$USERPROFILE/vimfiles/bundle')

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" 指定屏幕上可以进行分割布局的区域
set splitbelow
set splitright

" 快捷键切换分割布局
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" 代码折叠
" 开启此功能
set foldmethod=indent
set foldlevel=99
" 使用“空格键” 折叠 和 取消折叠 ，代替za
nnoremap <space> za
" 安装 SimplyFold 插件
Plugin 'tmhedberg/SimpyFold'
" 希望看到文档代码的折叠字符串
let g:SimplyFold_docstring_preview=1

" Python代码缩进
" 支持PEP8风格缩进
au BufNewFile,BufRead *.py
\ set tabstop=4
\ set softtabstop=4
\ set shiftwidth=4
\ set textwidth=79
\ set expandtab
\ set autoindent
\ set fileformat=unix
" 针对全栈开发
au BufNewFile,BufRead *.js, *.html, *.css
\ set tabstop=2
\ set softtabstop=2
\ set shiftwidth=2
" 自动缩进，使用indentpyton.vim插件
Plugin 'vim-scripts/indentpython.vim'
" 标示不必要的空白字符
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
" 支持UTF-8编码
"set encoding=utf-8
" 自动补全，使用YouCompleteMe
"Bundle 'Valloric/YouCompleteMe'

" 语法检查和高亮，使用syntastic插件
Plugin 'scrooloose/syntastic'
" 添加PEP8语法风格检查
Plugin 'nvie/vim-flake8'
let python_highlight_all=1
syntax on

" 配色方案，GUI模式尝试solarized方案，终端模式尝试Zenburn方案
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
" 逻辑判断
if has('gui_running')
  set background=dark
  colorscheme solarized
else
  colorscheme Zenburn
endif
" Solarized方案色调切换
call togglebg#map("<F5>")

" 文件浏览，使用NERDTree插件
Plugin 'scrooloose/nerdtree'
" 使用tab键，利用vim-nerdtree-tabs插件
Plugin 'jistr/vim-nerdtree-tabs'
" 隐藏.pyc文件
let NERDTreeIgnore=['\.pyc$','\~$']

" 超级搜索，使用ctrlP插件
Plugin 'kien/ctrlp.vim'

" 开启显示行号
set nu

" Git集成，使用vim-fugitive插件
Plugin 'tpope/vim-fugitive'

" Plowerline状态栏，可以显示当前的虚拟环境、git分支、正在编辑的文件等信息
Plugin 'Lokaltog/powerline', {'rtp':'powerline/bindings/vim/vim'}





" 初始安装后的配置
set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

