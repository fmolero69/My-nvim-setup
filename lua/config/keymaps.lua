-- Aliases:
local map = vim.keymap.set

-- Save current file
map('n', '<C-w>', ':w<CR>', { desc = 'Save file', noremap = true })

map('n', '<C-e>', ':E<CR>', { desc = 'Open Explore', noremap = true })

-- Reload fil
map('n', '<C-s>', ':so<CR>', { desc = 'Reload file', noremap = true })

-- Close file
map('n', '<C-q>', '<cmd>q<cr>', { desc = 'Close file', noremap = true })

-- Select all
map('n', '<C-a>', 'gg<S-v>G', { desc = 'Select all', noremap = true })

-- Split window
map('n', '<C-h>', ':split<Return><C-w>w', { desc = 'Split horizontal', noremap = true })
map('n', '<C-v>', ':vsplit<Return><C-w>w', { desc = 'Split vertical', noremap = true })

-- Search and replace
map('n', '<C-r>', ':%s/', { desc = 'Search and replace', noremap = true })

-- Call Neotree
map('n', '<C-n>', '<cmd>Neotree reveal toggle<cr>', { desc = 'Call Neotree', noremap = true, silent = true })

-- Call Lazy
map("n", "<C-l>", "<cmd>Lazy<CR>", { noremap = true, silent = true, desc = "Open LazyVim" })

-- Call Telescope
map('n', '<C-t>', ':Telescope find_files<CR>', { noremap = true, silent = true })

map('n', 'n', 'nzzzv', { desc = "Goes to the next result on the search and put the cursor in the middle" })
map('n', 'N', 'Nzzzv', { desc = "Goes to the prev result on the search and put the cursor in the middle" })

-- Fugitive keymaps
map('n', '<C-g>', ':Git<CR>', { desc = 'Call git' })
map('n', '<leader>gd', ':Git add .<CR>', { desc = 'Git add all files' })
map('n', '<leader>gc', ':Git commit -m ""<left><left>', { desc = 'Git commit with message' })
map('n', '<leader>gp', ':Git push<CR>', { desc = 'Git push' })
map('n', '<leader>ga', ':Git fetch --all -p<CR>', { desc = 'Git fetch' })
map('n', '<leader>gl', ':Git pull<CR>', { desc = 'Git pull' })

-- Configuración de Fugitive
vim.g.fugitive_gitlab_domains = { 'https://gitlab.com' }
vim.g.fugitive_github_domains = { 'https://github.com' }
