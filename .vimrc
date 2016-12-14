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
call dein#add('surround.vim')
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
call dein#add('ruby-matchit')
call dein#add('git-commit')
call dein#add('ekalinin/Dockerfile.vim')
call dein#add('osyo-manga/vim-monster')
call dein#add('lifepillar/vim-solarized8')

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
nmap <Esc><Esc> :nohlsearch<CR><Esc>

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

" When insert mode, enable hjkl and enable go to home/end.
imap <c-o> <END>
imap <c-a> <HOME>
imap <c-h> <LEFT>
imap <c-j> <DOWN>
imap <c-k> <UP>
imap <c-l> <Right>
imap <C-Space> <C-x><C-o>


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

" vim-indent-guides
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=black   ctermbg=235
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=darkgray ctermbg=236

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

" fzf
set rtp+=/usr/local/opt/fzf

" deoplete
let g:deoplete#enable_at_startup = 1

" vim-monster
let g:monster#completion#rcodetools#backend = "async_rct_complete"
let g:deoplete#sources#omni#input_patterns = {
\   "ruby" : '[^. *\t]\.\w*\|\h\w*::',
\}

" solarized8
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
