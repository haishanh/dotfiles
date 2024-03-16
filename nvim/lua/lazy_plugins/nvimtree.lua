return {
  {
    "nvim-tree/nvim-tree.lua",
    -- g? -> help
    -- default mapping
    -- https://github.com/nvim-tree/nvim-tree.lua/blob/d1410cb0896a3aad5d84ddc54284774a627c6d63/doc/nvim-tree-lua.txt#L1689
    opts = {
      filters = { custom = { "^.git$" } },
      disable_netrw = true,
      hijack_netrw = true,
      hijack_cursor = true,
      open_on_tab = false,
      update_focused_file = { enable = false },
      view = { width = 40, side = 'right' },
      git = { enable = false },
      trash = { cmd = "trash", require_confirm = true },
      renderer = {
        add_trailing = true,
        group_empty = true,
        indent_markers = {
          enable = true,
          icons = { corner = "╰", edge = "│ ", none = " " },
        },
        icons = {
          show = { git = true, folder_arrow = false, file = true },
          glyphs = {
            folder = {
              arrow_closed = ' ',
              arrow_open = ' ',
              default = '+',
              open = '-',
              empty = '',
              empty_open = '',
              symlink = '',
            }
          }
        },
        -- special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
      }
    },
    keys = {
      { "<leader>f", ":NvimTreeToggle<CR>", desc = "Toggle nvim tree" }
    }
  },
}
