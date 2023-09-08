return {
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    enabled = true,
    config = function()
      vim.cmd("colorscheme kanagawa-wave")
      -- vim.cmd("colorscheme kanagawa-dragon")
    end,
  },
  {
    "xero/miasma.nvim",
    lazy = false,
    priority = 1000,
    enabled = false,
    config = function()
      vim.cmd("colorscheme miasma")
    end,
  },
  {
    "felipeagc/fleet-theme-nvim",
    lazy = false,
    enabled = false,
    priority = 1000,
    config = function() vim.cmd("colorscheme fleet") end
  },
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    enabled = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme gruvbox]])
    end,
  },
  {
    -- 8/10
    -- 'nvimdev/zephyr-nvim',
    'haishanh/zephyr-nvim',
    lazy = false,
    enabled = false,
    priority = 1000,
    branch = 'haishan',
    config = function()
      vim.cmd [[colorscheme zephyr]]
    end
  },
  -- tokyonight
  {
    "folke/tokyonight.nvim",
    lazy = false,
    enabled = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme tokyonight]])
    end,
  },

  {
    "RRethy/nvim-base16",
    lazy = false,
    enabled = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme base16-circus]])
      -- vim.cmd([[colorscheme base16-danqing]])
    end,
  },

  {
    "bluz71/vim-moonfly-colors",
    name = "moonfly",
    lazy = false,
    enabled = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme moonfly]])
    end,
  },

  -- catppuccin
  {
    "catppuccin/nvim",
    enabled = false,
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme catppuccin]])
    end,
  },
}
