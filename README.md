vim-config
==========
###是什么?###

这是我的vim配置，当然，如果喜欢可以你可以随意拿去。(^_^)

###有什么?###

`pathogen.vim` 用于插件管理，把插件放到bundle目录就可以了。

`Trinity.vim` 用于集中管理taglist、nerdtree、srcexpl三个插件，按 `F8` 就可以快速打开这三个插件了。

`taglist.vim` 用于生成、展示函数列表

`nerdtree.vim` 用于生成、展示目录和文件

`srcexpl.vim` 用于函数的展示，当移动到函数上的之后，就会在srcexpl的窗口里面显示函数定义的。

`CSApprox.vim` 这是一个vim配色的插件，我比较喜欢desert这个配色。

`a.vim` 用于快速切换*.c和*.h

`ctrlp.vim` 用于文件的模糊搜索，能够加快打开文件的速度[效果](http://yikun.github.io/assets/post/2014-03-19-vim/vim_ctrlp.png)

`powerline.vim` 一个优雅的状态栏插件

`vimgrep` 自带插件，用于搜索tags中匹配字符，[效果](http://yikun.github.io/assets/post/2014-03-19-vim/vim_grep.png)

###怎么用？###
第一步，备份。

        # mv ~/.vim backup
        # mv ~/.vimrc backup

第二步，复制配置。

        # git clone https://github.com/Yikun/.vim.git ~/.vim
    
第三步，创建.vimrc链接

        # ln -s ~/.vim/.vimrc ~/.vimrc
        
最后，Enjoy it!
