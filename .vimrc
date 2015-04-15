set nocompatible
set clipboard  += unnamed

" Style
set ruler
set number
set showmatch
set incsearch
set autoindent
set tabstop     = 4
set shiftwidth  = 4
set softtabstop = 4
au FileType c,cpp,h,java,javascript,html setlocal cindent

" Color
set t_Co=256
colorscheme desert
syntax on

" Encoding
set fileencodings=utf-8,chinese,latin-1

" Vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'vim-scripts/a.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Lokaltog/vim-powerline'
Plugin 'wesleyche/SrcExpl'
Plugin 'vim-scripts/taglist.vim'
Plugin 'wesleyche/Trinity'

call vundle#end()
filetype plugin indent on

" Ctags
map <C-F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q.<CR>
set tags+=./vimtags


"映射光标在窗口间移动的快捷键
nmap <C-H> <C-W>h
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
nmap <C-L> <C-W>l

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

map ff :call Search_Word()<CR>:copen<CR>
function Search_Word()
	let w = expand("<cword>") " 在当前光标位置抓词
	execute "vimgrep " w " *"
endfunction

nmap <F4> :cn<cr>
nmap <F3> :cp<cr>

function! QFSwitch()
	redir => ls_output
	execute ':silent! ls'
	redir END

	let exists = match(ls_output, "[Quickfix List")
	if exists == -1
		execute ':copen'
	else
		execute ':cclose'
		execute ':TrinityToggleAll'
		execute ':TrinityToggleAll'
	endif
endfunction

map <C-o> <ESC>:call QFSwitch()<CR>

" Open and close all the three plugins on the same time 
nmap <F8>   :TrinityToggleAll<CR> 

" Open and close the srcexpl.vim separately 
nmap <F9>   :TrinityToggleSourceExplorer<CR> 

" Open and close the taglist.vim separately 
nmap <F10>  :TrinityToggleTagList<CR> 

" Open and close the NERD_tree.vim separately 
nmap <F11>  :TrinityToggleNERDTree<CR>