return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "mrjones2014/nvim-ts-rainbow",
      "nvim-treesitter/nvim-treesitter-textobjects"
    },
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
      auto_install = false,
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
          init_selection = "gnn",
          node_incremental = "grn",
          scope_incremental = "grc",
          node_decremental = "grm",
        },
      },
      -- https://github.com/mrjones2014/nvim-ts-rainbow
      -- rainbow = { enable = true },
      -- https://github.com/nvim-treesitter/playground
      playground = { enable = true },
      context_commentstring = {
        enable = true,
        enable_autocmd = false,
        config = {
          zig = {
            __default = '// %s',
          }
        }
      },
      textobjects = {
        select = {
          enable = true,

          -- Automatically jump forward to textobj, similar to targets.vim
          lookahead = true,

          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            -- You can optionally set descriptions to the mappings (used in the desc parameter of
            -- nvim_buf_set_keymap) which plugins like which-key display
            ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
            -- You can also use captures from other query groups like `locals.scm`
            ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
          },
          -- You can choose the select mode (default is charwise 'v')
          --
          -- Can also be a function which gets passed a table with the keys
          -- * query_string: eg '@function.inner'
          -- * method: eg 'v' or 'o'
          -- and should return the mode ('v', 'V', or '<c-v>') or a table
          -- mapping query_strings to modes.
          selection_modes = {
            ['@parameter.outer'] = 'v', -- charwise
            ['@function.outer'] = 'V',  -- linewise
            ['@class.outer'] = '<c-v>', -- blockwise
          },
          -- If you set this to `true` (default is `false`) then any textobject is
          -- extended to include preceding or succeeding whitespace. Succeeding
          -- whitespace has priority in order to act similarly to eg the built-in
          -- `ap`.
          --
          -- Can also be a function which gets passed a table with the keys
          -- * query_string: eg '@function.inner'
          -- * selection_mode: eg 'v'
          -- and should return true of false
          include_surrounding_whitespace = true,
        }
      }
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  }
}
