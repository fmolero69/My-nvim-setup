-- Alias
local opt = vim.opt

-- Set up appearance
opt.encoding = 'utf8'
opt.number = true
opt.relativenumber = true
opt.termguicolors = true

vim.bo.tabstop = 2
vim.bo.softtabstop = 2
vim.bo.shiftwidth = 2
vim.bo.expandtab = true

-- Resaltado de sintaxis
vim.cmd('syntax enable')            -- Activar resaltado de sintaxis
vim.cmd('filetype plugin indent on') -- Activar detección de tipo de archivo

-- Ejecutar script Lua con F5
-- Definición de la función para guardar y ejecutar el script Lua
local function save_and_run_lua()
  -- Guardar el archivo actual
  vim.cmd('write')

  -- Abrir un terminal horizontal en la parte inferior con un tamaño personalizado
  local width = vim.o.columns * 0.8 -- 80% del ancho de la ventana
  local height = vim.o.lines * 0.4 -- 40% de la altura de la ventana
  vim.cmd(string.format(":belowright split | resize %d", height))
  vim.cmd("term lua %") -- Ejecutar script de Lua
  vim.cmd("startinsert") -- Activar automáticamente el modo de inserción al abrir el terminal
  vim.cmd("autocmd BufWinEnter term://* setlocal nonumber") -- Ocultar los números de línea en el buffer del terminal
end

-- Asignación de la función a una variable global para hacerla accesible
_G.save_and_run_lua = save_and_run_lua

-- Mapeo de teclas para guardar y ejecutar el script Lua
vim.api.nvim_set_keymap('n', '<F5>', ':lua save_and_run_lua()<CR>', { noremap = true })
