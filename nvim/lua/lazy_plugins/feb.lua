return {
  {
    "j-hui/fidget.nvim",
    tag = "legacy",
    event = "LspAttach",
    opts = {
      -- options
    },
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
    -- config = function()
    --     vim.keymap.set('n', '<leader>dd', function() require("duck").hatch() end, {})
    --     vim.keymap.set('n', '<leader>dk', function() require("duck").cook() end, {})
    -- end
  },
  {
    'nvimdev/lspsaga.nvim',
    cmd = { 'Lspsaga' }
  },
  {
    'stevearc/overseer.nvim',
    opts = {},
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
    end
  }
}
