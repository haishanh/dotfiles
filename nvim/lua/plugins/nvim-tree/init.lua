-- https://github.com/kyazdani42/nvim-tree.lua

local M = {}
local g = vim.g;
local c = vim.cmd;

function M.setup_nvim_tree()
  require'nvim-tree'.setup {
    disable_netrw = true,
    hijack_netrw = true,
    hijack_cursor = true,
    update_focused_file = {
      enable = true,
    },
    view = {
      width = 40,
      side = 'right',
    },
    git = {
      enable = false,
    },
    trash = {
      cmd = "trash",
      require_confirm = true,
    },
    renderer = {
      add_trailing = true,
      indent_markers = {
        enable = true,
        icons = {
          corner = "└ ",
          edge = "│ ",
          none = "  ",
        },
      },
      icons = {
        show = { git = true, folder_arrow = false, },
        glyphs = {
          folder = {
            arrow_closed = ' ', arrow_open = ' ',
            default = '+', open = '-', empty = '',
            empty_open = '', symlink = '',
          }
        }
      },
      special_files = {
        "Cargo.toml", "Makefile", "README.md", "readme.md"
      },
    }
  }
end

c('hi NvimTreeFolderIcon   guifg=#addb67')
c('hi NvimTreeFolderName   guifg=#d6deeb')
c('hi NvimTreeGitDirty     guifg=#ff5874')
c('hi NvimTreeFileDirty    guifg=#ff5874')
c([[hi NvimTreeFolderIcon   guifg=#aaaaaa]])
c([[hi NvimTreeOpenedFile   guibg=#ff5874]])
c([[hi NvimTreeOpenedFile   guifg=#f1f1f1]])

-- vim.api.nvim_set_keymap('n', '<c-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('', '<leader>f', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

return M
