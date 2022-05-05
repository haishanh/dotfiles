-- https://github.com/kyazdani42/nvim-tree.lua

local M = {}
local g = vim.g;
local c = vim.cmd;

function M.setup_nvim_tree()
  require'nvim-tree'.setup {
    disable_netrw = true,
    hijack_netrw = true,
    hijack_cursor = true,
    -- follow = true,
    update_focused_file = {
      enable      = true,
      update_cwd  = false,
      ignore_list = {}
    },
    view = {
      width = 40,
      side = 'right',
      -- auto_resize = true,
    },
    trash = {
      cmd = "trash",
      require_confirm = true,
    },
    -- nvim_tree_ignore = {'.git', '.cache'}
  }
end

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

-- g.nvim_tree_width_allow_resize = 1

-- g.nvim_tree_ignore = {'.git', 'node_modules', '.cache'}
-- g.nvim_tree_ignore = {'.git', '.cache'}
g.nvim_tree_add_trailing = 1
g.nvim_tree_show_icons = {git = 0, folders = 1, files = 0}
g.nvim_tree_git_hl = 1
-- g.nvim_tree_auto_close = 1
-- g.nvim_tree_follow = 1
g.nvim_tree_special_files = { ['README.md'] = 1, Makefile = 1, MAKEFILE = 1 }
g.nvim_tree_icons = {
  default = '',
  symlink = '',
  folder = { default = '+', open = '-', empty = '', empty_open = '', symlink = '' },
  git = { unstaged = '', staged = '', unmerged = '', renamed = '', untracked = '' }
}

-- vim.api.nvim_set_keymap('n', '<c-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('', '<leader>f', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

return M
