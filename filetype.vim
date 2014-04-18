" nginx.vim
au BufRead,BufNewFile /home/kero/code/tengine/*,/usr/local/nginx/conf/* if &ft == '' | setfiletype nginx | endif
