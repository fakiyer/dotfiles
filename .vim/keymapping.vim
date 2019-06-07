let mapleader = "\<Space>"

noremap <CR> o<ESC>
nnoremap <f2> :NERDTreeToggle<CR>
" nmap <silent> <F8> <Plug>IndentGuidesToggle
nmap <silent> <F8> :IndentLinesToggle<CR>
nnoremap <F9> :set nonumber!<CR>
set pastetoggle=<F10>

nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up>   gk
set whichwrap=b,s,h,l,<,>,[,]
nmap <CR> i<CR><ESC>

imap <c-o> <END>
imap <c-a> <HOME>
imap <c-h> <LEFT>
imap <c-j> <DOWN>
imap <c-k> <UP>
imap <c-l> <RIGHT>
imap <C-Space> <C-x><C-o>
nmap <Esc><Esc> :nohlsearch<CR><Esc>
noremap <Leader>h ^
noremap <Leader>l $
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>ss :wq<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>d :Denite
nnoremap <Leader>dy :Denite neoyank<CR>
nnoremap <Leader>f :ProjectFiles<CR>
nnoremap <Leader>g :Rg<CR>
nnoremap <Leader>ra :A<CR>
nnoremap <Leader>re :R<CR>
nnoremap <Leader>rc :Econtroller<CR>
nnoremap <Leader>rm :Emodel<CR>
nnoremap <Leader>rv :Eview<CR>
nnoremap <Leader>rr :History<CR>
" nnoremap <Leader>p :Pt<CR>
" nnoremap <Leader>t :terminal<CR>

" EasyMotion
" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)
vmap s <Plug>(easymotion-bd-f2)
" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" vim-test
nnoremap <Leader>tn :TestNearest<CR>
nnoremap <Leader>tf :TestFile<CR>


inoremap jj <ESC>

vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]
