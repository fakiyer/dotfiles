local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- keymap.set("", "<CR>", "o<ESC>", opts)
keymap.set("n", "<CR>", "i<CR><ESC>")
keymap.set("n", "<F8>", "<cmd>IndentLinesToggle<CR>")
keymap.set("n", "<F9>", "<cmd>set nonumber!<CR>", opts)

keymap.set("n", "j", "gj", opts)
keymap.set("n", "k", "gk", opts)
keymap.set("n", "<Down>", "gj", opts)
keymap.set("n", "<Up>", "gk", opts)

keymap.set("i", "<c-o>", "<END>")
keymap.set("i", "<c-a>", "<HOME>")
keymap.set("i", "<c-h>", "<LEFT>")
keymap.set("i", "<c-j>", "<DOWN>")
keymap.set("i", "<c-k>", "<UP>")
keymap.set("i", "<c-l>", "<RIGHT>")
keymap.set("i", "jj", "<ESC>", opts)

keymap.set("n", "<ESC><ESC>", "<cmd>nohlsearch<CR><ESC>")

keymap.set("", "<Leader>h", "^", opts)
keymap.set("", "<Leader>l", "$", opts)
keymap.set("n", "<Leader>w", "<cmd>w<CR>", opts)
keymap.set("n", "<Leader>q", "<cmd>q<CR>", opts)
keymap.set("n", "<Leader>ss", "<cmd>wq<CR>", opts)

keymap.set("n", "<Leader>b", "<cmd>Buffers<CR>", opts)
keymap.set("n", "<Leader>f", "<cmd>ProjectFiles<CR>", opts)
keymap.set("n", "<Leader>g", "<cmd>Rg<CR>", opts)
-- keymap.set("n", "<Leader>re", "<cmd>:R<CR>", opts)
keymap.set("n", "<Leader>ra", "<cmd>Other<CR>", opts)
-- keymap.set("n", "<Leader>rc", "<cmd>Other controller<CR>", opts)
-- keymap.set("n", "<Leader>rm", "<cmd>Other model<CR>", opts)
-- keymap.set("n", "<Leader>rv", "<cmd>Other view<CR>", opts)
-- keymap.set("n", "<Leader>rs", "<cmd>Other spec<CR>", opts)
keymap.set("n", "<Leader>rr", "<cmd>History<CR>", opts)
-- keymap.set("n", "<Leader>t", "<cmd>terminal<CR>", opts)

-- copy & paste
keymap.set("v", "y", "y`]", opts)
keymap.set("v", "p", "p`]", opts)
keymap.set("n", "p", "p`]", opts)

-- terminal
keymap.set("t", "<ESC>", "<C-\\><C-n>", opts)
