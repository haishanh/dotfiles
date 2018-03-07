-- https://github.com/kyazdani42/nvim-tree.lua

local g = vim.g;
local c = vim.cmd;

c('hi NvimTreeFolderIcon   guifg=#addb67')
c('hi NvimTreeFolderName   guifg=#d6deeb')
c('hi NvimTreeGitDirty     guifg=#ff5874')
c('hi NvimTreeFileDirty    guifg=#ff5874')
c([[hi NvimTreeFolderIcon   guifg=#aaaaaa]])
c([[hi NvimTreeOpenedFile   guibg=#ff5874]])
c([[hi NvimTreeOpenedFile   guifg=#f1f1f1]])
-- c([[hi link NvimTreeMarkdownFile Normal]])

-- :help nvim_tree_highlight

-- NvimTreeGitDirty
-- NvimTreeGitStaged
-- NvimTreeGitMerge
-- NvimTreeGitRenamed
-- NvimTreeGitNew

g.nvim_tree_side = 'right'
g.nvim_tree_width = 40
g.nvim_tree_width_allow_resize = 1
g.nvim_tree_ignore = {'.git', 'node_modules', '.cache'}
g.nvim_tree_add_trailing = 1
g.nvim_tree_show_icons = {git = 0, folders = 1, files = 1}
g.nvim_tree_git_hl = 1
g.nvim_tree_auto_close = 1
g.nvim_tree_follow = 1
g.nvim_tree_icons = {
  default = '',
  symlink = '',
  folder = { default = '+', open = '-', empty = '', empty_open = '', symlink = '' },
  git = { unstaged = '', staged = '', unmerged = '', renamed = '', untracked = '' }
}

-- vim.api.nvim_set_keymap('n', '<c-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('', '<leader>f', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
