" NERD Commenter
let NERDShutUp = 1 "no alart undfined filetype


" rails.vim
let g:rails_level = 3


" own
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1
let loaded_matchparen = 1
"hi LineNr ctermfg=DarkGray ctermbg=Black
hi LineNr ctermfg=DarkGray


" NERD_tree.vim
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" let g:NERDTreeDirArrows=0
" let g:NERDTreeMouseMode=0


" indentline
let g:indentLine_enabled = 0
let g:indentLine_color_gui = '#2c3e50'


" fzf
set rtp+=/usr/local/opt/fzf

function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

command! ProjectFiles execute 'Files' s:find_git_root()

" " Similarly, we can apply it to fzf#vim#grep. To use ripgrep instead of pt:
" command! -bang -nargs=* Pt
"   \ call fzf#vim#grep(
"   \   'pt --column --ignore=.git --global-gitignore '.shellescape(<q-args>), 1,
"   \   <bang>0 ? fzf#vim#with_preview('up:60%')
"   \           : fzf#vim#with_preview({ 'dir': s:find_git_root() }),
"   \   <bang>0)

" Similarly, we can apply it to fzf#vim#grep. To use ripgrep instead of ag:
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview({ 'dir': s:find_git_root() }),
  \   <bang>0)

" Likewise, Files command with preview window
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" Command for git grep
" - fzf#vim#grep(command, with_column, [options], [fullscreen])
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep('git grep --line-number '.shellescape(<q-args>), 0, <bang>0)


" nvim
let g:python_host_prog = expand('/usr/local/bin/python2')
let g:python3_host_prog = expand('/usr/local/bin/python3')


" deoplete
" let g:deoplete#enable_at_startup = 1
" " let g:deoplete#auto_complete_delay = 10
" let g:deoplete#sources = {}
" let g:deoplete#sources._ = ['buffer', 'tag', 'file', 'neosnippet']
" let deoplete#tag#cache_limit_size = 5000000


" vim-monster
" let g:monster#completion#backend = "solargraph"
" let g:monster#completion#solargraph#backend = "async_solargraph_suggest"
" let g:deoplete#sources#omni#input_patterns = {
" \   "ruby" : '[^. *\t]\.\w*\|\h\w*::',
" \}


" coc.nvim
" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

let g:coc_global_extensions = []
let g:coc_global_extensions += ['coc-yank']
let g:coc_global_extensions += ['coc-json']
let g:coc_global_extensions += ['coc-yaml']
let g:coc_global_extensions += ['coc-solargraph']

hi HighlightedyankRegion term=bold ctermbg=0 guibg=#13354A

" solarized8
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"


" easymotion
let g:EasyMotion_do_mapping = 0


" neoterm
" let g:neoterm_default_mod='belowright'
" let g:neoterm_autoinsert = 1


" floaterm
let g:floaterm_width = 1.0
let g:floaterm_height = 0.6
let g:floaterm_position = 'bottom'
let g:floaterm_opener = 'edit'


" lf.vim
let g:lf_replace_netrw = 1
let g:lf_map_keys = 0


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


" vim-test
let test#strategy = 'floaterm'
let test#ruby#rspec#executable = 'rspec'
function! DockerTransformer(cmd) abort
  let container_id = system("docker ps | grep app | awk '{print $1}' | head -n1")
  return 'docker exec -t ' . container_id . ' ' . a:cmd
endfunction
let g:test#custom_transformations = {'docker': function('DockerTransformer')}
let g:test#transformation = 'docker'


" jq
command! Jqf %!jq '.'


" rust
let g:rustfmt_autosave = 1


" ctags
set tags+=.git/tags
