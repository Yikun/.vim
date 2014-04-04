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
" set fdm=syntax "代码折叠
set t_Co=256
colorscheme desert
filetype plugin indent on
syntax on
set fileencodings=utf-8,chinese,latin-1
"configure tags - add additional tags here or comment out not-used ones
set tags+=~/.vim/tags/cpp
set tags+=./vimtags
" taglist
"let Tlist_Show_One_File = 1            "不同时显示多个文件的tag，只显示当前文件的
"let Tlist_Exit_OnlyWindow = 1          "如果taglist窗口是最后一个窗口，则退出vim
"let Tlist_Inc_Winwidth=0			   "如果在文本界面下运行vim,则将窗口长度设为0
"let Tlist_Auto_Open=1				   "自动打开Tlist
"let Tlist_Use_Right_Window=1
" 设置Tlist快捷键
"map <C-l> :TlistToggle<CR>
"map <C-l> :Tlist<CR>

" build tags of your own project with Ctrl-F12
map <C-F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q.<CR>

" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]

"automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest

"插入模式下方框变成光标
if has("autocmd")
	au InsertEnter * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"
	au InsertLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"
endif

"插件安装管理
call pathogen#infect()

"文件打开插件
"map <C-t> :NERDTreeMirror<CR>
"map <C-t> :NERDTreeToggle<CR>

"SrcExpl
"nmap <F8> :SrcExplToggle<CR>    "快捷键映射
"let g:SrcExpl_winHeight = 8     "默认高度
"let g:SrcExpl_refreshTime = 100 "更新时间(ms)
"let g:SrcExpl_isUpdateTags = 0  "每次打开SrcExpl时是否更新tags(0为不更新)
"let g:SrcExpl_updateTagsKey = "<F12>"   "更新tags的快捷键
"let g:SrcExpl_jumpKey = "<ENTER>"
"let g:SrcExpl_gobackKey = "<SPACE>"

"let g:SrcExpl_pluginList = [
"       \ "__Tag_List__",
"       \ "_NERD_tree_",
"       \ "Source_Explorer"
"   \ ]
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

"
" Setting for python
"
let g:pymode_lint_write = 0
"let g:pymode_doc = 1
"let g:pymode_doc_key = 'K'

"let g:pymode_run = 1
"let g:pymode_run_key = '<leader>r'



" Load rope plugin
let g:pymode_rope = 1

" Auto create and open ropeproject
let g:pymode_rope_auto_project = 0

" Enable autoimport
let g:pymode_rope_enable_autoimport = 0

" Auto generate global cache
let g:pymode_rope_autoimport_generate = 1
let g:pymode_rope_autoimport_underlineds = 0
let g:pymode_rope_codeassist_maxfixes = 10
let g:pymode_rope_sorted_completions = 1
let g:pymode_rope_extended_complete = 1
let g:pymode_rope_autoimport_modules = ["os","shutil","datetime"]
let g:pymode_rope_confirm_saving = 1
let g:pymode_rope_global_prefix = "<C-x>p"
let g:pymode_rope_local_prefix = "<C-x>r"
let g:pymode_rope_vim_completion = 1
let g:pymode_rope_guess_project = 1
let g:pymode_rope_goto_def_newwin = ""
let g:pymode_rope_always_show_complete_menu = 1

let g:pymode_folding = 1
let g:pymode_motion = 1
let g:pymode_virtualenv = 1

let g:pymode_options_indent = 1
let g:pymode_options_other = 1

let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'mccabe']

let python_highlight_all = 1

" Double tab show Doc
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview
