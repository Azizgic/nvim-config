local o = vim.o

-- clipboard
o.clipboard = "unnamedplus"

-- indentation
o.shiftwidth = 4
o.tabstop = 4
o.expandtab = true
o.smartindent = true

-- line numbers
o.number = true
o.relativenumber = true

-- UI
o.wrap = false
o.termguicolors = true
o.cursorline = true
o.cursorlineopt = "both"
o.cmdheight = 1

-- scrolling
o.scrolloff = 8
o.sidescroll = 4

-- performance
o.lazyredraw = true
o.updatetime = 300
o.timeoutlen = 900
o.autoread = true -- auto reload on external file change

-- search
o.ignorecase = true
o.smartcase = true
o.hlsearch = true
o.incsearch = true

-- splits
o.splitbelow = false
o.splitright = true

o.undofile = true -- persistant undo

-- completion
o.completeopt = "menuone,noselect"

-- folding
o.foldmethod = "indent"
o.foldlevel = 99

-- netrw   
vim.g.netrw_banner = 0
vim.g.netrw_browse_split = 4  -- open in prior window or vertical if none
vim.g.netrw_winsize = 35      -- width of the explorer window
vim.g.netrw_liststyle = 3  -- tree-style listing
