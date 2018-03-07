-- https://github.com/nvim-lua/completion-nvim

require'completion'.on_attach()

vim.api.nvim_set_keymap('i', '<c-k>', '<Plug>(completion_trigger)', { noremap = true, silent = true })
vim.g.completion_enable_snippet = 'UltiSnips'
-- vim.g.completion_confirm_key = '<cr>'
-- let g:completion_confirm_key = "\<C-y>"
vim.g.completion_matching_strategy_list = {'exact', 'substring', 'fuzzy', 'all'}
vim.g.completion_chain_complete_list = {
  default = {
    { complete_items = { 'lsp' } },
    { complete_items = { 'buffers' } },
    { mode = { '<c-p>' } },
    { mode = { '<c-n>' } }
  },
}
