" ����Vundle

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

" ָ����Ļ�Ͽ��Խ��зָ�ֵ�����
set splitbelow
set splitright

" ��ݼ��л��ָ��
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" �����۵�
" �����˹���
set foldmethod=indent
set foldlevel=99
" ʹ�á��ո���� �۵� �� ȡ���۵� ������za
nnoremap <space> za
" ��װ SimplyFold ���
Plugin 'tmhedberg/SimpyFold'
" ϣ�������ĵ�������۵��ַ���
let g:SimplyFold_docstring_preview=1

" Python��������
" ֧��PEP8�������
au BufNewFile,BufRead *.py
\ set tabstop=4
\ set softtabstop=4
\ set shiftwidth=4
\ set textwidth=79
\ set expandtab
\ set autoindent
\ set fileformat=unix
" ���ȫջ����
au BufNewFile,BufRead *.js, *.html, *.css
\ set tabstop=2
\ set softtabstop=2
\ set shiftwidth=2
" �Զ�������ʹ��indentpyton.vim���
Plugin 'vim-scripts/indentpython.vim'
" ��ʾ����Ҫ�Ŀհ��ַ�
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
" ֧��UTF-8����
"set encoding=utf-8
" �Զ���ȫ��ʹ��YouCompleteMe
"Bundle 'Valloric/YouCompleteMe'

" �﷨���͸�����ʹ��syntastic���
Plugin 'scrooloose/syntastic'
" ���PEP8�﷨�����
Plugin 'nvie/vim-flake8'
let python_highlight_all=1
syntax on

" ��ɫ������GUIģʽ����solarized�������ն�ģʽ����Zenburn����
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
" �߼��ж�
if has('gui_running')
  set background=dark
  colorscheme solarized
else
  colorscheme Zenburn
endif
" Solarized����ɫ���л�
call togglebg#map("<F5>")

" �ļ������ʹ��NERDTree���
Plugin 'scrooloose/nerdtree'
" ʹ��tab��������vim-nerdtree-tabs���
Plugin 'jistr/vim-nerdtree-tabs'
" ����.pyc�ļ�
let NERDTreeIgnore=['\.pyc$','\~$']

" ����������ʹ��ctrlP���
Plugin 'kien/ctrlp.vim'

" ������ʾ�к�
set nu

" Git���ɣ�ʹ��vim-fugitive���
Plugin 'tpope/vim-fugitive'

" Plowerline״̬����������ʾ��ǰ�����⻷����git��֧�����ڱ༭���ļ�����Ϣ
Plugin 'Lokaltog/powerline', {'rtp':'powerline/bindings/vim/vim'}





" ��ʼ��װ�������
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

