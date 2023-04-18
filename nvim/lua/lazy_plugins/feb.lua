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
  }
}
