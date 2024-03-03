local g = vim.g
local opt = vim.opt
local cmd = vim.cmd

g.mapleader = " "

-- g.loaded_matchparen = 1

-- Display
opt.termguicolors = true
opt.background = "dark"

-- Option
opt.showmode = false
opt.title = true
opt.ruler = true
opt.list = true
opt.listchars = "tab:>-,trail:-,extends:>,precedes:<"
opt.laststatus = 2

-- Edit
opt.autoindent = true
opt.smartindent = true
opt.expandtab = true
opt.smarttab = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 0
opt.showmatch = true
opt.wildmenu = true
opt.clipboard = "unnamed"
opt.autoread = true
opt.hidden = true
opt.showcmd = true
opt.backspace = "indent,eol,start"
opt.hlsearch = true
opt.number = true

-- Search
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.wrapscan = false

--- Bell
opt.visualbell = true
-- opt.t_vb = nil

opt.cmdheight = 2
opt.shortmess:append "c"
opt.whichwrap:append("b,s,h,l,<,>,[,]")
opt.modifiable = true
opt.write = true
