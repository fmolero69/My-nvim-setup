return {
  'nvim-telescope/telescope.nvim',
  event = 'VeryLazy',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-file-browser.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make'
    }
  },
  config = function()
    -- Configuración de Telescope
    local telescope = require('telescope')
    telescope.setup {
      defaults = {
        file_ignore_patterns = { "node_modules", ".git" },
        prompt_prefix = "🔍 ",
        selection_caret = "❯ ",
        entry_prefix = "  ",
        initial_mode = "insert",
        scroll_strategy = "cycle",
        sorting_strategy = "ascending",
        -- Otras opciones de configuración...
        layout_config = {
          prompt_position = "top",
          preview_width = 0.5,
          results_width = 0.5,
          width = 0.65, -- Incrementa el ancho de la ventana
          height = 0.6, -- Incrementa la altura de la ventana
          preview_cutoff = 120,
        },
      },
      -- Otras opciones de configuración...
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
         file_browser = {
          theme = "dropdown",
          -- disables netrw and use telescope-file-browser in its place
          hijack_netrw = true,
          mappings = {
             ["i"] = {
              -- your custom insert mode mappings
            },
            ["n"] = {
              -- your custom normal mode mappings
            },
          },
        },
      },
    }
 end
}
