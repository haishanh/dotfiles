return {
  {
    "felipeagc/fleet-theme-nvim",
    lazy = false,
    enabled = true,
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
    'nvimdev/zephyr-nvim',
    lazy = false,
    enabled = false,
    priority = 1000,
    -- branch = 'haishan',
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
