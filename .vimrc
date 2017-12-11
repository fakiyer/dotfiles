source ~/.vim/bundle.vim
source ~/.vim/basic.vim
source ~/.vim/keymapping.vim
source ~/.vim/plugin.vim

" auto command
" --------------------
augroup BufferAu
autocmd!
" change current directory
autocmd BufNewFile,BufRead,BufEnter * if isdirectory(expand("%:p:h")) && bufname("%") !~ "NERD_tree" | cd %:p:h | endif
augroup END
