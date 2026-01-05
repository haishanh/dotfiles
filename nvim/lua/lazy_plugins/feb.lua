return {
    {
        "mbbill/undotree"
    },


    {
        "lervag/wiki.vim",
        lazy = true,
        event = "VeryLazy",
        opts = {},
        config = function(_, _opts)
            vim.g.wiki_root = '~/wiki'
            -- vim.g.wiki_select_method = {
            --   pages = vim.fn['wiki#fzf#pages']
            -- }
            -- vim.g.wiki_select_method = {
            --   pages = require("wiki.ui_select").pages,
            --   tags = require("wiki.ui_select").tags,
            --   toc = require("wiki.ui_select").toc,
            --   links = require("wiki.ui_select").links,
            -- }
        end
    },
    {
        "yorickpeterse/nvim-tree-pairs",
        lazy = true,
        event = "VeryLazy",
    },

    {
        'echasnovski/mini.clue',
        version = '*',
        config = function()
            local miniclue = require('mini.clue')
            miniclue.setup({
                window = {
                    config = {
                        width = 'auto',
                    }
                },
                triggers = {
                    -- Leader triggers
                    { mode = 'n', keys = '<Leader>' },
                    { mode = 'x', keys = '<Leader>' },

                    -- Built-in completion
                    { mode = 'i', keys = '<C-x>' },

                    -- `g` key
                    { mode = 'n', keys = 'g' },
                    { mode = 'x', keys = 'g' },

                    -- Marks
                    { mode = 'n', keys = "'" },
                    { mode = 'n', keys = '`' },
                    { mode = 'x', keys = "'" },
                    { mode = 'x', keys = '`' },

                    -- Registers
                    { mode = 'n', keys = '"' },
                    { mode = 'x', keys = '"' },
                    { mode = 'i', keys = '<C-r>' },
                    { mode = 'c', keys = '<C-r>' },

                    -- Window commands
                    { mode = 'n', keys = '<C-w>' },

                    -- `z` key
                    { mode = 'n', keys = 'z' },
                    { mode = 'x', keys = 'z' },
                },

                clues = {
                    -- Enhance this by adding descriptions for <Leader> mapping groups
                    miniclue.gen_clues.builtin_completion(),
                    miniclue.gen_clues.g(),
                    miniclue.gen_clues.marks(),
                    miniclue.gen_clues.registers(),
                    miniclue.gen_clues.windows(),
                    miniclue.gen_clues.z(),
                },
            })
        end
    },


    {
        "tpope/vim-dispatch",
        cmd = { "Dispatch" },
    },
    {
        "utilyre/sentiment.nvim",
        version = "*",
        event = "VeryLazy", -- keep for lazy loading
        opts = {
            -- config
        },
        init = function()
            -- `matchparen.vim` needs to be disabled manually in case of lazy loading
            vim.g.loaded_matchparen = 1
            -- vim.cmd([[ highlight MatchParen guibg=#606060 cterm=NONE gui=NONE ]])
        end,
    },
    {
        'tamton-aquib/duck.nvim',
        keys = {
            { '<leader>dd', function() require("duck").hatch("🦀", 5) end },
            { '<leader>dk', function() require("duck").cook() end },
        }
    },
    {
        'stevearc/overseer.nvim',
        opts = {},
        cmd = { "OverseerRun", "OverseerToggle" }
    },
    {
        "famiu/bufdelete.nvim",
        cmd = { "Bdelete", "Bwipeout" },
    },
    {
        'tzachar/local-highlight.nvim',
        enabled = false,
        config = function()
            require('local-highlight').setup()
        end
    },

    {
        "chrisgrieser/nvim-various-textobjs",
        event = "VeryLazy",
        opts = {
            keymaps = {
                useDefaults = true,
            }
        },
    },

    {
        'tpope/vim-fugitive',
        event = 'VeryLazy',
    },

    {
        'nvimdev/indentmini.nvim',
        event = 'BufEnter',
        enabled = false,
        -- this is no required but if you want indent blanklink line this is needed
        dependencies = { 'nvim-treesitter/nvim-treesitter' }
    },

}
