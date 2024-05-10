
-- Configuración de indentación para archivos Bash
vim.bo.tabstop = 2
vim.bo.softtabstop = 2
vim.bo.shiftwidth = 2
vim.bo.expandtab = true

-- Funciones de indentación personalizadas para Bash
local function bash_indent(line_num)
  local line = vim.api.nvim_buf_get_lines(0, line_num - 1, line_num, true)[1]
  local indent = 0

  -- Detectar bloques de código
  if line:match("^%s*then$") or line:match("^%s*do$") or line:match("^%s*else$") or line:match("^%s*elif") then
    indent = indent + vim.bo.shiftwidth
  elseif line:match("^%s*fi$") or line:match("^%s*done$") then
    indent = indent - vim.bo.shiftwidth
  end

  -- Detectar líneas de continuación
  if line:match("\\%s*$") then
    indent = indent + vim.bo.shiftwidth
  end

  return indent
end

-- Establecer la función de indentación personalizada
vim.bo.indentexpr = "bash_indent(v:lnum)"
vim.bo.indentkeys = "0=then,0=do,0=else,0=elif,0=fi,0=done"

-- Ejecutar script Bash con F5
-- Definición de la función para guardar y ejecutar el script Bash
local function save_and_run_bash()
  -- Guardar el archivo actual
  vim.cmd('write')

  -- Abrir un terminal horizontal en la parte inferior con un tamaño personalizado
  local width = vim.o.columns * 0.8 -- 80% del ancho de la ventana
  local height = vim.o.lines * 0.4 -- 40% de la altura de la ventana
  vim.cmd(string.format(":belowright split | resize %d", height))
  vim.cmd("term bash %") -- Ejecutar script Bash
  vim.cmd("startinsert") -- Activar automáticamente el modo de inserción al abrir el terminal
  vim.cmd("autocmd BufWinEnter term://* setlocal nonumber") -- Ocultar los números de línea en el buffer del terminal
end

-- Asignación de la función a una variable global para hacerla accesible
_G.save_and_run_bash = save_and_run_bash

-- Mapeo de teclas para guardar y ejecutar el script Bash
vim.api.nvim_set_keymap('n', '<F5>', ':lua save_and_run_bash()<CR>', { noremap = true })
