if &compatible
  set nocompatible
endif

set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

call dein#begin('~/.vim/dein')

call dein#add('Shougo/dein.vim')

call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('Shougo/vimproc.vim',       {'build' : 'make'})
call dein#add('Shougo/denite.nvim')
call dein#add('Shougo/neoyank.vim')
call dein#add('Shougo/neomru.vim')
call dein#add('Shougo/deoplete.nvim')
call dein#add('Lokaltog/vim-easymotion')

call dein#add('tpope/vim-fugitive')
call dein#add('tpope/vim-surround')
call dein#add('tpope/vim-endwise',        { 'on_i': 1 })
call dein#add('tomtom/tcomment_vim')
call dein#add('nathanaelkane/vim-indent-guides')
call dein#add('terryma/vim-expand-region')
call dein#add('itchyny/lightline.vim')
" call dein#add('scrooloose/nerdtree')
call dein#add('jlanzarotta/bufexplorer')
call dein#add('vim-scripts/AnsiEsc.vim')
call dein#add('lifepillar/vim-solarized8')
call dein#add('junegunn/fzf',             { 'build': './install --all', 'merged': 0 })
call dein#add('junegunn/fzf.vim',         { 'depends': 'fzf' })
" call dein#add('tpope/vim-rails')
" call dein#add('tpope/vim-bundler')
call dein#add('vim-scripts/ruby-matchit')
call dein#add('vim-ruby/vim-ruby',        { 'on_ft': 'ruby' })
call dein#add('osyo-manga/vim-monster',   { 'on_ft': 'ruby' })
call dein#add('rust-lang/rust.vim',       { 'on_ft': 'rust' })
call dein#add('slim-template/vim-slim',   { 'on_ft': 'slim' })
call dein#add('kchmck/vim-coffee-script', { 'on_ft': 'coffee' })
call dein#add('ekalinin/Dockerfile.vim',  { 'on_ft': ['Dockerfile', 'docker-compose']})

call dein#end()

filetype plugin indent on
syntax enable

if dein#check_install()
  call dein#install()
endif
