set nocompatible
set clipboard+=unnamed

" Style
set ruler
set number
set showmatch
set incsearch
set autoindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set laststatus=2
au FileType c,cpp,h,java,javascript,html setlocal cindent

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
Plugin 'tomasr/molokai'

call vundle#end()
filetype plugin indent on

" Color
let g:rehash256 = 1
colorscheme molokai
syntax on

" Switch windows
nmap <C-H> <C-W>h
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
nmap <C-L> <C-W>l

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" ff
map ff :call Search_Word()<CR>:copen<CR>
function Search_Word()
	let w = expand("<cword>")
	execute "vimgrep " w " *"
endfunction

nmap <F4> :cn<cr>
nmap <F3> :cp<cr>

" ctrl + o, open/close ff
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

" Ctags
let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
