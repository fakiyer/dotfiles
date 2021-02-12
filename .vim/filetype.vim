au BufRead,BufNewFile */templates/*.conf.template if &ft == '' | setfiletype nginx | endif
au BufRead,BufNewFile *.jb if &ft == '' | setfiletype ruby | endif
au BufRead,BufNewFile *.hcl if &ft == '' | setfiletype terraform | endif
