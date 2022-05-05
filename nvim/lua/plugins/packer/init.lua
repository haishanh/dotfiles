vim.cmd [[packadd packer.nvim]]

local config = require('plugins/config')

local startup = function()
  use {'wbthomason/packer.nvim', opt = true}
  use {'tpope/vim-dispatch', cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}
  use {'kyazdani42/nvim-tree.lua', config = function() require('plugins/nvim-tree').setup_nvim_tree() end}

  -- lsp
  -- use { 'williamboman/nvim-lsp-installer' }
  use { 'neovim/nvim-lspconfig', config = config.config_lsp,
    requires = 'williamboman/nvim-lsp-installer'}
  -- use { 'nvim-lua/lsp-status.nvim', disable = true }
  use { 'quangnguyen30192/cmp-nvim-ultisnips', requires = 'hrsh7th/nvim-cmp' }
  use {
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-nvim-lsp-signature-help',
    requires = 'hrsh7th/nvim-cmp' }
  use { 'hrsh7th/cmp-nvim-lsp', requires = 'hrsh7th/nvim-cmp' }
  use { 'hrsh7th/cmp-buffer', requires = 'hrsh7th/nvim-cmp' }
  use { 'hrsh7th/cmp-cmdline', requires = 'hrsh7th/nvim-cmp' }
  use { 'uga-rosa/cmp-dictionary', requires = 'hrsh7th/nvim-cmp' }
  use { 'hrsh7th/nvim-cmp', config = config.config_cmp }
  -- use { 'onsails/lspkind-nvim' }
  use { 'jose-elias-alvarez/nvim-lsp-ts-utils' }
  use { 'jose-elias-alvarez/null-ls.nvim', config = config.config_null_ls }

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

  use {
    'prettier/vim-prettier',
    run = 'yarn',
  }

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
  -- use {
  --   '~/h/nvim-nonicons',
  --   requires = {'kyazdani42/nvim-web-devicons'}
  -- }
  use {
    -- depends on the font https://github.com/yamatsum/nonicons
    'yamatsum/nvim-nonicons',
    requires = {'kyazdani42/nvim-web-devicons'}
  }
  -- use {'p00f/nvim-ts-rainbow', disable = true }
  use {'nvim-treesitter/playground', cmd = {'TSPlaygroundToggle'}}
  use {
    -- 'NTBBloodbath/galaxyline.nvim',
    'dsych/galaxyline.nvim',
    -- 'glepnir/galaxyline.nvim',
    branch = 'bugfix/diagnostics',
    config = config.config_galaxyline,
    -- requires = {'kyazdani42/nvim-web-devicons'}
    -- requires = {'kyazdani42/nvim-web-devicons', 'yamatsum/nvim-web-nonicons'}
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
    commit = 'fdeb794ee7c4b',
    config = function() require('nvim-autopairs').setup() end,
    event = 'BufEnter'
  }
  use {
    'akinsho/nvim-bufferline.lua', disable = true,
    -- requires = {'kyazdani42/nvim-web-devicons','yamatsum/nvim-nonicons'},
    config = function() require('plugins/bufferline') end,
  }
  use {
    "folke/trouble.nvim",
    -- requires = "kyazdani42/nvim-web-devicons",
    config = function() require("trouble").setup {} end,
    event = 'BufEnter'
  }
  use {
    "folke/which-key.nvim", disable = true,
    config = function() require("which-key").setup {} end,
    event = 'BufEnter'
  }

  use {
    'ggandor/lightspeed.nvim'
  }
  -- use {'phaazon/hop.nvim', as = 'hop', config = config.config_hop}

  -- use 'projekt0n/github-nvim-theme'
  use {"folke/zen-mode.nvim", config = function() require("zen-mode").setup {} end, event = 'BufEnter'}

  -- :Twilight - toggle twilight
  use {"folke/twilight.nvim", config = function() require("twilight").setup {} end, event = 'BufEnter'}

  -- use {'beloglazov/vim-textobj-quotes', event = 'BufEnter'}
  use {'lukas-reineke/indent-blankline.nvim', event = 'BufEnter'}

  -- theme / colorscheme
  use { 'rose-pine/neovim', disable = true, as = 'rose-pine',
    config = function()
      vim.g.rose_pine_variant = 'moon'
      vim.g.rose_pine_disable_italics = true
      -- Load colorscheme after options
      vim.cmd('colorscheme rose-pine')
    end
  }
  use { "rebelot/kanagawa.nvim",
    disable = true,
    config = function()
      require'kanagawa'.setup({ dimInactive = true, globalStatus = true })
      vim.cmd("colorscheme kanagawa")
    end
  }

  use {
    "akinsho/toggleterm.nvim",
    disable = true,
    config = function()
      require("toggleterm").setup{
        open_mapping = [[<c-\>]],
        shell = '/bin/zsh'
      }
      -- vim.api.nvim_set_keymap("n", "<leader>x", ":ToggleTerm<CR>", {})
    end
  }
end

return require('packer').startup(startup)
