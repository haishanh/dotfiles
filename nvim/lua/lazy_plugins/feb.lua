return {
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

  { "Cassin01/wf.nvim",
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
