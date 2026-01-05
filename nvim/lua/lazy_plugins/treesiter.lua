return {
    {
        "nvim-treesitter/nvim-treesitter",
        -- tag = 'v0.9.0',
        -- commit = 'ee107fc759647293a84ad42b867f518331364fbe',
        -- version = false, -- last release is way too old
        event = { "BufReadPost", "BufNewFile" },
        keys = {
            { "<c-y>", desc = "Increment selection" },
            { "<bs>",  desc = "Schrink selection",  mode = "x" },
        },
        opts = {
            -- supported langs https://github.com/nvim-treesitter/nvim-treesitter#supported-languages
            -- ensure_installed = {
            --   "typescript","javascript","html","css","scss","svelte", "dockerfile", "bash","markdown","toml","zig","yaml"
            -- },
            auto_install = true,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
                -- disable for large file
                disable = function(lang, buf)
                    local max_filesize = 100 * 1024 -- 100 KB
                    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                    if ok and stats and stats.size > max_filesize then
                        return true
                    end
                end,
            },
            indent = { enable = true },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "gni",
                    node_incremental = "gnj",
                    node_decremental = "gnk",
                    scope_incremental = "gns",
                },
            },
            -- https://github.com/nvim-treesitter/playground
            playground = { enable = true }
        },
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end,
    }
}
