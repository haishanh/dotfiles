return {
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    event = "VeryLazy",
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
      {"<c-.>", ":Telescope<CR>"}
    }
  }
}
