vim.cmd [[packadd packer.nvim]]

local config = require('plugins/config')

local startup = function()
  use {'wbthomason/packer.nvim', opt = true}
  use {'tpope/vim-dispatch', cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}
  use {'kyazdani42/nvim-tree.lua', config = function() require('plugins/nvim-tree') end}

  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      {'nvim-lua/popup.nvim'},
      {'nvim-lua/plenary.nvim'},
      {'fannheyward/telescope-coc.nvim'},
      {'nvim-telescope/telescope-fzy-native.nvim'},
      {'nvim-telescope/telescope-symbols.nvim'}
    },
    setup = config.setup_telescope,
    config = config.config_telescope,
    cmd = 'Telescope'
  }

  -- use {
  --   'prettier/vim-prettier',
  --   run = 'yarn',
  --   ft = {'javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'}
  -- }

  -- use {'nvim-lua/completion-nvim'}
  -- use {
  --   'hrsh7th/nvim-compe',
  --   event = 'InsertEnter',
  --   config = function() require('plugins/nvim-compe') end,
  -- }

  use {'sunjon/shade.nvim', disable = true, config = config.config_sunjon_shade}

  use 'tpope/vim-commentary'
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  -- use { 'b3nj5m1n/kommentary', config = config.config_kommentary, event = 'BufEnter' }

  use {
    -- <leader>gy for normal and visual mode
    'ruifm/gitlinker.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = function() require('gitlinker').setup() end,
    event = 'BufEnter'
  }
  use {
    'nvim-treesitter/nvim-treesitter', run = ':TSUpdate',
    config = function() require('plugins/treesitter/config') end,
  }
  -- use {'p00f/nvim-ts-rainbow', disable = true }
  use {'nvim-treesitter/playground', cmd = {'TSPlaygroundToggle'}}
  use {
    'glepnir/galaxyline.nvim',
    branch = 'main',
    config = config.config_galaxyline,
    requires = {'kyazdani42/nvim-web-devicons', 'yamatsum/nvim-web-nonicons'}
  }
  use {
    'norcalli/nvim-colorizer.lua',
    config = function() require('colorizer').setup() end,
    event = 'BufEnter'
  }
  use {
    'lewis6991/gitsigns.nvim',
    requires = {'nvim-lua/plenary.nvim'},
    config = [[require('plugins/gitsigns/config')]],
    event = 'BufEnter'
  }
  use {
    'windwp/nvim-autopairs',
    config = function() require('nvim-autopairs').setup() end,
    event = 'BufEnter'
  }
  use {
    'akinsho/nvim-bufferline.lua', disable = true,
    requires = {'kyazdani42/nvim-web-devicons','yamatsum/nvim-web-nonicons'},
    config = function() require('plugins/bufferline') end,
  }
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function() require("trouble").setup {} end,
    event = 'BufEnter'
  }
  use {
    "folke/which-key.nvim",
    config = function() require("which-key").setup {} end,
    event = 'BufEnter'
  }

  use {'phaazon/hop.nvim', as = 'hop', config = config.config_hop}

  -- use 'projekt0n/github-nvim-theme'
  use {"folke/zen-mode.nvim", config = function() require("zen-mode").setup {} end, event = 'BufEnter'}

  -- :Twilight - toggle twilight
  use {"folke/twilight.nvim", config = function() require("twilight").setup {} end, event = 'BufEnter'}

  -- use {'beloglazov/vim-textobj-quotes', event = 'BufEnter'}
  use {'lukas-reineke/indent-blankline.nvim', event = 'BufEnter'}
end

return require('packer').startup(startup)
