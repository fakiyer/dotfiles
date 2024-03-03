-- nvim
vim.g.python_host_prog = vim.fn.expand('/usr/local/bin/python2')
vim.g.python3_host_prog = vim.fn.expand('/usr/local/bin/python3')

-- gtags
vim.opt.tags:append('.git/tags')

-- jq
vim.cmd([[ command! Jqf %!jq '.' ]])

-- coc
vim.cmd([[ hi HighlightedyankRegion term=bold ctermbg=0 guibg=#13354A ]])
vim.cmd([[ hi CocMenuSel ctermbg=237 guibg=#44617b ]])
vim.cmd([[ hi CocSearch ctermfg=12 guifg=#18A3FF ]])

vim.cmd([[
function s:MkNonExDir(file, buf)
  if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
    let dir=fnamemodify(a:file, ':h')
    if !isdirectory(dir)
      call mkdir(dir, 'p')
    endif
  endif
endfunction

augroup BWCCreateDir
  autocmd!
  autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END
]])


-- filetype
vim.cmd([[ au BufRead,BufNewFile *.jb setfiletype ruby ]])
-- vim.cmd([[ au BufRead,BufNewFile *.hcl setfiletype terraform ]])
