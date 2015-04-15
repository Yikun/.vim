set nocp
set nocompatible
"设置行号
set number
set showmatch
set ruler
set incsearch
"设置自动缩进
set autoindent
"设置制表符宽度为4
set tabstop=4
"设置缩进的空格数为4
set shiftwidth=4
set softtabstop=4
"设置使用C/C++自动缩进
set cindent                           
set nobackup                       
set clipboard+=unnamed
set t_Co=256
colorscheme desert
filetype plugin indent on
syntax on
set fileencodings=utf-8,chinese,latin-1
"configure tags - add additional tags here or comment out not-used ones
set tags+=~/.vim/tags/cpp
set tags+=./vimtags

" build tags of your own project with Ctrl-F12
map <C-F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q.<CR>

"插件安装管理
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

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