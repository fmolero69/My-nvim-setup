local treesitter_config = {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
    },
    build = ":TSUpdate",
    event = "VeryLazy",
    main = "nvim-treesitter.configs",
    opts = {
        ensure_installed = {
            "c",
            "lua",
            "luadoc",
            "python",
        },
        sync_install = false,

        auto_install = true,

        highlight = {
            enable = true,
        },
        indent = {
            enable = true,
        },
    },
}

return treesitter_config
