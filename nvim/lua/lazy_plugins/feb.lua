return {
  {
    'simrat39/symbols-outline.nvim',
    cmd = { "SymbolsOutline" },
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
  -- https://github.com/simrat39/rust-tools.nvim/issues/422
  {
    'simrat39/rust-tools.nvim',
    event = "VeryLazy",
    ft = { 'rust' },
    config = function()
      local rt = require("rust-tools")
      rt.setup()
      rt.inlay_hints.enable()
    end
  },
  -- {
  --   'mrcjkb/rustaceanvim',
  --   version = '^3', -- Recommended
  --   ft = { 'rust' },
  --   config = function()
  --     vim.g.rustaceanvim = {}
  --   end
  -- },
  {
    'stevearc/oil.nvim',
    cmd = { "Oil" },
    opts = {
      delete_to_trash = true,
      trash_command = 'trash',
      float = {
        padding = 4,
        max_width = 0,
        max_height = 0,
        border = "rounded",
        win_options = {
          winblend = 10,
        },
        -- This is the config that will be passed to nvim_open_win.
        -- Change values here to customize the layout
        override = function(conf)
          return conf
        end,
      },

    },
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
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
    enabled = false,
    opts = {
      useDefaultKeymaps = true,
    },
  },

  {
    'tpope/vim-fugitive',
    event = 'VeryLazy',
  },

  {
    'nvimdev/indentmini.nvim',
    event = 'BufEnter',
    -- this is no required but if you want indent blanklink line this is needed
    dependencies = { 'nvim-treesitter/nvim-treesitter' }
  },

  {
    "Cassin01/wf.nvim",
    version = "*",
    enabled = false,
    config = function()
      require("wf").setup()

      local which_key = require("wf.builtin.which_key")
      local register = require("wf.builtin.register")
      local bookmark = require("wf.builtin.bookmark")
      local buffer = require("wf.builtin.buffer")
      local mark = require("wf.builtin.mark")

      -- Register
      vim.keymap.set(
        "n",
        "<Space>wr",
        -- register(opts?: table) -> function
        -- opts?: option
        register(),
        { noremap = true, silent = true, desc = "[wf.nvim] register" }
      )

      -- Bookmark
      vim.keymap.set(
        "n",
        "<Space>wbo",
        -- bookmark(bookmark_dirs: table, opts?: table) -> function
        -- bookmark_dirs: directory or file paths
        -- opts?: option
        bookmark({
          dotfiles = "~/dotfiles",
          zsh = "~/.zshrc",
        }),
        { noremap = true, silent = true, desc = "[wf.nvim] bookmark" }
      )

      -- Buffer
      vim.keymap.set(
        "n",
        "<Space>wbu",
        -- buffer(opts?: table) -> function
        -- opts?: option
        buffer(),
        { noremap = true, silent = true, desc = "[wf.nvim] buffer" }
      )

      -- Mark
      vim.keymap.set(
        "n",
        "'",
        -- mark(opts?: table) -> function
        -- opts?: option
        mark(),
        { nowait = true, noremap = true, silent = true, desc = "[wf.nvim] mark" }
      )

      -- Which Key
      vim.keymap.set(
        "n",
        "<Leader>",
        -- mark(opts?: table) -> function
        -- opts?: option
        which_key({ text_insert_in_advance = "<Leader>" }),
        { noremap = true, silent = true, desc = "[wf.nvim] which-key /", }
      )
    end,
  }
}
