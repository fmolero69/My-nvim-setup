-- Alias
local api = vim.api
local opt = vim.opt

-- Configuración de apariencia
opt.encoding = 'utf8'
opt.number = true
opt.relativenumber = true
opt.termguicolors = true

-- Configuración básica
vim.bo.shiftwidth = 4
vim.bo.tabstop = 4
vim.bo.expandtab = true
vim.bo.autoindent = true
vim.bo.smartindent = true

-- Resaltado de sintaxis
vim.cmd('syntax enable')
vim.cmd('filetype plugin indent on')

-- Ejecutar script Python con F5
local function save_and_run_python()
  -- Guardar el archivo actual
  vim.cmd('write')

  -- Abrir un terminal horizontal en la parte inferior con un tamaño personalizado
  local width = vim.o.columns * 0.8 -- 80% del ancho de la ventana
  local height = vim.o.lines * 0.4 -- 40% de la altura de la ventana
  vim.cmd(string.format(":belowright split | resize %d", height))
  vim.cmd("term python3 %")
  vim.cmd("startinsert") -- Activar automáticamente el modo de inserción al abrir el terminal
  vim.cmd("autocmd BufWinEnter term://* setlocal nonumber") -- Ocultar los números de línea en el buffer del terminal
end

-- Asignación de la función a una variable global para hacerla accesible
_G.save_and_run_python = save_and_run_python

-- Mapeo de teclas para guardar y ejecutar el script Python
api.nvim_set_keymap('n', '<F5>', ':lua save_and_run_python()<CR>', { noremap = true })
