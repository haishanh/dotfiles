local ts_config = require("nvim-treesitter.configs")

-- vim.api.nvim_command('set foldmethod=expr')
-- vim.api.nvim_command('set foldexpr=nvim_treesitter#foldexpr()')

ts_config.setup {
  -- supported langs https://github.com/nvim-treesitter/nvim-treesitter#supported-languages
  ensure_installed = {
    "typescript","javascript","html","css","scss","svelte",
    "dockerfile",
    "bash","markdown","toml","zig","yaml"
  },
  highlight = {
    enable = true,
    -- use_languagetree = true,
  },
  indent = {enable = true},
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<CR>',
      scope_incremental = '<CR>',
      node_incremental = '<TAB>',
      node_decremental = '<S-TAB>',
    },
  },
  -- https://github.com/p00f/nvim-ts-rainbow
  rainbow = {enable = true},
  -- https://github.com/nvim-treesitter/playground
  playground = {enable = true},
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
        ["ic"] = "@class.inner",
      },
    },
  },
}
