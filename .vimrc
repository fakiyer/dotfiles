""""""""""""""""""""""""""""""
" Dein
""""""""""""""""""""""""""""""
if &compatible
  set nocompatible
endif

set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

call dein#begin('~/.vim/dein')

call dein#add('Shougo/dein.vim')

call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
call dein#add('Shougo/denite.nvim')
call dein#add('Shougo/neoyank.vim')
call dein#add('Shougo/neomru.vim')
call dein#add('Shougo/deoplete.nvim')

call dein#add('tpope/vim-fugitive')
call dein#add('vim-scripts/surround.vim')
call dein#add('tomtom/tcomment_vim')
call dein#add('tpope/vim-endwise')
call dein#add('vim-scripts/AnsiEsc.vim')
call dein#add('nathanaelkane/vim-indent-guides')
call dein#add('terryma/vim-expand-region')
call dein#add('itchyny/lightline.vim')
call dein#add('vim-ruby/vim-ruby')
call dein#add('tpope/vim-rails')
call dein#add('scrooloose/nerdtree')
call dein#add('tpope/vim-rake')
call dein#add('tpope/vim-bundler')
call dein#add('tpope/vim-projectionist')
call dein#add('jlanzarotta/bufexplorer')
call dein#add('vim-scripts/ruby-matchit')
call dein#add('vim-scripts/git-commit')
call dein#add('ekalinin/Dockerfile.vim')
call dein#add('osyo-manga/vim-monster')
call dein#add('lifepillar/vim-solarized8')
call dein#add('junegunn/fzf', { 'build': './install --all', 'merged': 0 })
call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })
call dein#add('rust-lang/rust.vim')
call dein#add('slim-template/vim-slim')
call dein#add('kchmck/vim-coffee-script')

call dein#end()

filetype plugin indent on
syntax enable

if dein#check_install()
  call dein#install()
endif


""""""""""""""""""""""""""""""
" Display
""""""""""""""""""""""""""""""
colorscheme solarized8_dark
set termguicolors
set background=dark

""""""""""""""""""""""""""""""
" Option
""""""""""""""""""""""""""""""
set noshowmode
set title
set ruler
set list " show eol,tab,etc...
set listchars=tab:>-,trail:-,extends:>,precedes:< " eol:$
set laststatus=2
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]

" edit
" ----------------------
set autoindent
set smartindent
set expandtab
set smarttab
set tabstop=2 shiftwidth=2 softtabstop=0
set showmatch " show mactch brace
set wildmenu
set clipboard=unnamed " share OS clipboard
set autoread
set hidden
set showcmd
set backspace=indent,eol,start
set hlsearch
set number

highlight link ZenkakuSpace Error
match ZenkakuSpace /<81>@/

" search
" ----------------------
set incsearch
set ignorecase
set smartcase
set hlsearch
set nowrapscan

" no bell
" ----------------------
set visualbell
set t_vb=

" key map
" --------------------
let mapleader = "\<Space>"

noremap <CR> o<ESC>
nnoremap <f2> :NERDTreeToggle<CR>
nmap <silent> <F8> <Plug>IndentGuidesToggle
nnoremap <F9> :set nonumber!<CR>
set pastetoggle=<F10>

nnoremap j gj
nnoremap k gk
set whichwrap=b,s,h,l,<,>,[,]

imap <c-o> <END>
imap <c-a> <HOME>
imap <c-h> <LEFT>
imap <c-j> <DOWN>
imap <c-k> <UP>
imap <c-l> <Right>
imap <C-Space> <C-x><C-o>
nmap <Esc><Esc> :nohlsearch<CR><Esc>
noremap <Leader>h ^
noremap <Leader>l $
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>s :wq<CR>
nnoremap <Leader>m :Emodel
nnoremap <Leader>v :Eview
nnoremap <Leader>c :Econtroller
nnoremap <Leader>d :Denite
nnoremap <Leader>dy :Denite neoyank<CR>
nnoremap <Leader>f :ProjectFiles<CR>
nnoremap <Leader>r :History<CR>
nnoremap <Leader>p :Pt<CR>
inoremap jj <ESC>

vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" auto command
" --------------------
augroup BufferAu
autocmd!
" change current directory
autocmd BufNewFile,BufRead,BufEnter * if isdirectory(expand("%:p:h")) && bufname("%") !~ "NERD_tree" | cd %:p:h | endif
augroup END

" Plugin setting
" --------------------

" NERD Commenter
let NERDShutUp = 1 "no alart undfined filetype


" rails.vim
let g:rails_level=3


" own
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1
let loaded_matchparen = 1
"hi LineNr ctermfg=DarkGray ctermbg=Black
hi LineNr ctermfg=DarkGray


" NERD_tree.vim
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeDirArrows=0
let g:NERDTreeMouseMode=0


" fzf
set rtp+=/usr/local/opt/fzf

function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

command! ProjectFiles execute 'Files' s:find_git_root()

" Similarly, we can apply it to fzf#vim#grep. To use ripgrep instead of pt:
command! -bang -nargs=* Pt
  \ call fzf#vim#grep(
  \   'pt --column '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" Likewise, Files command with preview window
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" Command for git grep
" - fzf#vim#grep(command, with_column, [options], [fullscreen])
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep('git grep --line-number '.shellescape(<q-args>), 0, <bang>0)


" nvim
let g:python3_host_prog = expand('/usr/local/bin/python3')


" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_delay = 10


" vim-monster
let g:monster#completion#rcodetools#backend = "async_rct_complete"
let g:deoplete#sources#omni#input_patterns = {
\   "ruby" : '[^. *\t]\.\w*\|\h\w*::',
\}


" solarized8
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"


" lightline
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'mode_map': { 'c': 'NORMAL' },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
      \ },
      \ 'component_function': {
      \   'modified': 'LightLineModified',
      \   'readonly': 'LightLineReadonly',
      \   'fugitive': 'LightLineFugitive',
      \   'filename': 'LightLineFilename',
      \   'fileformat': 'LightLineFileformat',
      \   'filetype': 'LightLineFiletype',
      \   'fileencoding': 'LightLineFileencoding',
      \   'mode': 'LightLineMode',
      \ },
      \ 'separator': { 'left': '⮀', 'right': '⮂' },
      \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
      \ }

function! LightLineModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightLineReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? '⭤' : ''
endfunction

function! LightLineFilename()
  return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineFugitive()
  if &ft !~? 'vimfiler\|gundo' && exists("*fugitive#head")
    let branch = fugitive#head()
    return branch !=# '' ? '⭠ '.branch : ''
  endif
  return ''
endfunction

function! LightLineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightLineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightLineFileencoding()
  return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightLineMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction
