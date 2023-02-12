return {
  {
    "kyazdani42/nvim-tree.lua",
    opts = {
      disable_netrw = true,
      hijack_netrw = true,
      hijack_cursor = true,
      open_on_tab = false,
      update_focused_file = { enable = true },
      view = { width = 40, side = 'right' },
      git = { enable = false },
      trash = { cmd = "trash", require_confirm = true },
      renderer = {
        add_trailing = true,
        indent_markers = {
          enable = true,
          -- icons = { corner = "└", edge = "│ ", none = "  " },
          icons = { corner = "╰", edge = "│ ", none = " " },
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
        -- special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
      }
    },
    keys = {
      {"<leader>f", ":NvimTreeToggle<CR>", desc = "Toggle nvim tree"}
    }
  },

  -- easily jump to any location and enhanced f/t motions for Leap
  {
    "ggandor/leap.nvim",
    event = "VeryLazy",
    dependencies = { { "ggandor/flit.nvim", opts = { labeled_modes = "nv" } } },
    config = function(_, opts)
      local leap = require("leap")
      for k, v in pairs(opts) do
        leap.opts[k] = v
      end
      leap.add_default_mappings(true)
      vim.keymap.del({ "x", "o" }, "x")
      vim.keymap.del({ "x", "o" }, "X")
    end,
  },

  -- git signs
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      signs = {
        -- add = { hl = 'GitSignsAdd', text = '▏', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
        -- add = {hl = "DiffAdd", text = "▏", numhl = "GitSignsAddNr"},
        -- add = {hl = "DiffAdd", text = "▏"},
        -- change = {hl = "DiffChange", text = "▏", numhl = "GitSignsChangeNr"},
        -- delete = {hl = "DiffDelete", text = "▏", numhl = "GitSignsDeleteNr"},
        -- topdelete = {hl = "DiffDelete", text = "‾", numhl = "GitSignsDeleteNr"},
        -- changedelete = {hl = "DiffChange", text = "~", numhl = "GitSignsChangeNr"}
      },
      keymaps = {
        -- Default keymap options
        noremap = true,
        buffer = true,
        ["n ]c"] = { expr = true, '&diff ? \']c\' : \'<cmd>lua require"gitsigns".next_hunk()<CR>\'' },
        ["n [c"] = { expr = true, '&diff ? \'[c\' : \'<cmd>lua require"gitsigns".prev_hunk()<CR>\'' },
        ["n <leader>hs"] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
        ["n <leader>hu"] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
        ["n <leader>hr"] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
        ["n <leader>hp"] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
        ["n <leader>hb"] = '<cmd>lua require"gitsigns".blame_line()<CR>'
      },
      -- sign_priority = 5,
    },
  },

  -- trouble.nvim
  {
    "folke/trouble.nvim",
    cmd = { "TroubleToggle", "Trouble" },
    opts = { use_diagnostic_signs = true },
    keys = {
      { "<leader>xx", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Document Diagnostics (Trouble)" },
      { "<leader>xX", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics (Trouble)" },
      { "<leader>xL", "<cmd>TroubleToggle loclist<cr>", desc = "Location List (Trouble)" },
      { "<leader>xQ", "<cmd>TroubleToggle quickfix<cr>", desc = "Quickfix List (Trouble)" },
    },
  },

  -- indent guides for Neovim
  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      -- char = "▏",
      char = "│",
      filetype_exclude = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy" },
      show_trailing_blankline_indent = false,
      show_current_context = false,
    },
  },

  -- auto pairs
  {
    "echasnovski/mini.pairs",
    event = "VeryLazy",
    config = function(_, opts)
      require("mini.pairs").setup(opts)
    end,
  },

  {
    "prettier/vim-prettier",
    cmd = { "Prettier", "PrettierAsync" },
    build = "pnpm i",
  },

  -- library used by other plugins
  { "nvim-lua/plenary.nvim", lazy = true },
  { dir = "~/h/nvim-nonicons", lazy = true },
  { "kyazdani42/nvim-web-devicons", lazy = true },

  -- makes some plugins dot-repeatable like leap
  { "tpope/vim-repeat", event = "VeryLazy" },
}
