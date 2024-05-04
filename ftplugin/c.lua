-- Alias
local map = vim.api.nvim_set_keymap
local opt = vim.opt

-- Set up appearance
opt.encoding = 'utf8'
opt.number = true
opt.relativenumber = true
opt.termguicolors = true

-- Configuración básica
vim.opt.tabstop = 4                  -- Ancho de tabulación = 4 espacios
vim.opt.shiftwidth = 4               -- Ancho de indentación = 4 espacios
vim.opt.expandtab = true             -- Usar espacios en lugar de tabulaciones
vim.opt.autoindent = true            -- Autoindentación
vim.opt.smartindent = true           -- Indentación inteligente

-- Resaltado de sintaxis
vim.cmd('syntax enable')             -- Activar resaltado de sintaxis
vim.cmd('filetype plugin indent on') -- Activar detección de tipo de archivo

-- Compilar y ejecutar con F5
--map('n', '<F5>', ':w<CR>:!gcc % -o %< && ./%<CR>', { noremap = true })  

-- Compilar y ejecutar con F5
vim.keymap.set('n', '<F5>', function()
  vim.cmd('w')
  local filename = vim.fn.expand('%:t:r')
  vim.cmd('!gcc % -o ' .. filename)
  vim.cmd('!chmod +x ' .. filename)
  vim.cmd('!' .. './' .. filename)
end, { noremap = true })

