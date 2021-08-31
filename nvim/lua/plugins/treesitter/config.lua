local ts_config = require("nvim-treesitter.configs")

-- vim.api.nvim_command('set foldmethod=expr')
-- vim.api.nvim_command('set foldexpr=nvim_treesitter#foldexpr()')

ts_config.setup {
  ensure_installed = {"typescript","javascript","html","css","svelte","bash","lua"},
  highlight = {
    enable = true,
    -- use_languagetree = true,
  },
  -- indent = {enable = true},
  incremental_selection = {
    enable = true;
  },
  -- https://github.com/p00f/nvim-ts-rainbow
  rainbow = {enable = true},
  -- https://github.com/nvim-treesitter/playground
  playground = {enable = true},
  context_commentstring = {enable = true}
}
