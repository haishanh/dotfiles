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
    opts = {
      useDefaultKeymaps = true,
    },
  },
}
