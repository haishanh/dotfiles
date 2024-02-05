return {
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
      -- vim.api.nvim_set_hl(0, "LeapMatch", { bg = '#ff0000' })
    end,
  },

  -- auto pairs
  {
    "echasnovski/mini.pairs",
    event = "VeryLazy",
    config = function(_, opts)
      require("mini.pairs").setup(opts)
    end,
  },

  { "mhinz/vim-sayonara",    cmd = { "Sayonara" } },

  -- library used by other plugins
  { "nvim-lua/plenary.nvim", lazy = true },
  { "tpope/vim-repeat",      event = "VeryLazy" },
}
