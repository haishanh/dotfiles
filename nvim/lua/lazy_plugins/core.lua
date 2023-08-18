return {
  {
    "nvim-tree/nvim-tree.lua",
    -- default mapping
    -- https://github.com/nvim-tree/nvim-tree.lua/blob/d1410cb0896a3aad5d84ddc54284774a627c6d63/doc/nvim-tree-lua.txt#L1689
    opts = {
      filters = { custom = { "^.git$" } },
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
      attach_to_untracked = false,
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', ']c', function()
          if vim.wo.diff then return ']c' end
          vim.schedule(function() gs.next_hunk() end)
          return '<Ignore>'
        end, { expr = true })

        map('n', '[c', function()
          if vim.wo.diff then return '[c' end
          vim.schedule(function() gs.prev_hunk() end)
          return '<Ignore>'
        end, { expr = true })

        -- Actions
        map('n', '<leader>hs', gs.stage_hunk)
        map('n', '<leader>hr', gs.reset_hunk)
        map('v', '<leader>hs', function() gs.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
        map('v', '<leader>hr', function() gs.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
        map('n', '<leader>hS', gs.stage_buffer)
        map('n', '<leader>hu', gs.undo_stage_hunk)
        map('n', '<leader>hR', gs.reset_buffer)
        map('n', '<leader>hp', gs.preview_hunk)
        map('n', '<leader>hb', function() gs.blame_line { full = true } end)
        map('n', '<leader>tb', gs.toggle_current_line_blame)
        map('n', '<leader>hd', gs.diffthis)
        map('n', '<leader>hD', function() gs.diffthis('~') end)
        map('n', '<leader>td', gs.toggle_deleted)

        -- Text object
        map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
      end,
      -- sign_priority = 5,
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
  { "mhinz/vim-sayonara",          cmd = { "Sayonara" } },

  -- library used by other plugins
  { "nvim-lua/plenary.nvim",       lazy = true },
  { "tpope/vim-repeat",            event = "VeryLazy" },
  { dir = "~/h/nvim-nonicons",     lazy = true },
  { "nvim-tree/nvim-web-devicons", lazy = true },
}
