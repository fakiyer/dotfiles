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
" nnoremap <Leader>m :Emodel
" nnoremap <Leader>v :Eview
" nnoremap <Leader>c :Econtroller
nnoremap <Leader>d :Denite
nnoremap <Leader>dy :Denite neoyank<CR>
nnoremap <Leader>f :ProjectFiles<CR>
nnoremap <Leader>r :History<CR>
nnoremap <Leader>p :Pt<CR>
nnoremap <Leader>t :terminal<CR>
inoremap jj <ESC>

vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]
