-- S E T T I N G S

-- Aliases:
local opt = vim.opt

-- Clipboard
opt.clipboard:append("unnamedplus")

-- Set up appearance
opt.encoding = 'utf8'
opt.number = true
opt.relativenumber = true
opt.termguicolors = true

-- Set up search
opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

-- Set up indentation
opt.undofile = true
opt.updatetime = 50
opt.colorcolumn = { 120 }
