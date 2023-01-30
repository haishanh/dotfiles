vim.cmd [[packadd packer.nvim]]

local config = require('plugins/config')

local startup = function(use)
  use { 'wbthomason/packer.nvim', opt = true }

  use { "almo7aya/openingh.nvim" }
  use { 'tpope/vim-dispatch', cmd = { 'Dispatch', 'Make', 'Focus', 'Start' } }
  use { 'kyazdani42/nvim-tree.lua', config = function() require('plugins/nvim-tree').setup_nvim_tree() end }
  use { 'SirVer/ultisnips',
    requires = { { 'honza/vim-snippets', rtp = '.' } },
    config = function()
      vim.g.UltiSnipsExpandTrigger = '<Plug>(ultisnips_expand)'
      vim.g.UltiSnipsJumpForwardTrigger = '<Plug>(ultisnips_jump_forward)'
      vim.g.UltiSnipsJumpBackwardTrigger = '<Plug>(ultisnips_jump_backward)'
      vim.g.UltiSnipsListSnippets = '<c-x><c-s>'
      vim.g.UltiSnipsRemoveSelectModeMappings = 0
    end
  }
  use { 'charludo/projectmgr.nvim', disable = true }
  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },
    },
    config = function()
      local lsp = require('lsp-zero')
      lsp.preset('recommended')
      lsp.on_attach(function(_client, bufnr)
        local opts = { buffer = bufnr, remap = false }
        local bind = vim.keymap.set

        bind('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
        bind('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
      end)
      lsp.ensure_installed({ 'tsserver', 'eslint', 'sumneko_lua', 'cssls', 'svelte', 'rust_analyzer' })
      lsp.nvim_workspace()
      lsp.setup()
      -- https://github.com/neovim/nvim-lspconfig/wiki/UI-Customization
      vim.diagnostic.config({
        virtual_text = {
          prefix = '○',
        },
        signs = true, underline = false
      })
    end
  }

  -- lsp
  -- use { 'williamboman/mason.nvim' }
  -- use { 'williamboman/mason-lspconfig.nvim' }
  -- use { 'neovim/nvim-lspconfig', config = config.config_lsp }
  -- use {
  --   'glepnir/lspsaga.nvim',
  --   config = config.config_lspsaga,
  --   cmd = 'Lspsaga',
  -- }
  -- use { 'quangnguyen30192/cmp-nvim-ultisnips', requires = 'hrsh7th/nvim-cmp' }
  -- use {
  --   'hrsh7th/cmp-path',
  --   'hrsh7th/cmp-nvim-lsp-signature-help',
  --   requires = 'hrsh7th/nvim-cmp'
  -- }
  -- use { 'hrsh7th/cmp-nvim-lsp', requires = 'hrsh7th/nvim-cmp' }
  -- use { 'hrsh7th/cmp-buffer', requires = 'hrsh7th/nvim-cmp' }
  -- use { 'hrsh7th/cmp-cmdline', requires = 'hrsh7th/nvim-cmp' }
  -- use { 'uga-rosa/cmp-dictionary', requires = 'hrsh7th/nvim-cmp' }
  -- use { 'hrsh7th/nvim-cmp', config = config.config_cmp }
  -- use { 'onsails/lspkind-nvim' }
  -- use { 'jose-elias-alvarez/nvim-lsp-ts-utils' }
  -- use { 'jose-elias-alvarez/null-ls.nvim', config = config.config_null_ls }

  use { 'mbbill/undotree', cmd = 'UndotreeToggle', config = config.config_undotree }

  use { 'stevearc/dressing.nvim' }
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      { 'nvim-lua/popup.nvim' },
      { 'nvim-lua/plenary.nvim' },
      -- {'fannheyward/telescope-coc.nvim'},
      { 'nvim-telescope/telescope-fzy-native.nvim' },
      { 'nvim-telescope/telescope-symbols.nvim' }
    },
    setup = config.setup_telescope,
    config = config.config_telescope,
    -- cmd = 'Telescope'
  }

  use { 'nvim-telescope/telescope-project.nvim' }

  use {
    'prettier/vim-prettier',
    run = 'yarn',
  }

  use { 'sunjon/shade.nvim', disable = true, config = config.config_sunjon_shade }

  use 'tpope/vim-commentary'
  use {
    'JoosepAlviste/nvim-ts-context-commentstring',
    requires = { 'nvim-treesitter/nvim-treesitter' }
  }

  use {
    -- <leader>gy for normal and visual mode
    'ruifm/gitlinker.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = function() require('gitlinker').setup() end,
    event = 'BufEnter'
  }

  use { 'nvim-treesitter/nvim-treesitter', config = require('plugins/treesitter/config').config_treesitter }
  use { 'nvim-treesitter/playground', cmd = { 'TSPlaygroundToggle' } }
  use { 'nvim-treesitter/nvim-treesitter-textobjects' }

  use {
    -- depends on the font https://github.com/yamatsum/nonicons
    '~/h/nvim-nonicons',
    -- 'yamatsum/nvim-nonicons',
    -- config = config.config_icons,
    requires = { 'kyazdani42/nvim-web-devicons' }
  }
  -- use {'p00f/nvim-ts-rainbow', disable = true }
  use {
    'glepnir/galaxyline.nvim',
    config = require('plugins/galaxyline/config'),
  }
  use {
    'simrat39/symbols-outline.nvim'
  }
  use {
    'norcalli/nvim-colorizer.lua',
    disable = true,
    config = function() require('colorizer').setup() end,
    event = 'BufEnter'
  }
  use {
    'lewis6991/gitsigns.nvim',

    requires = { 'nvim-lua/plenary.nvim' },
    config = [[require('plugins/gitsigns/config')]],
    event = 'BufEnter'
  }
  use {
    'windwp/nvim-autopairs',
    -- commit = 'fdeb794ee7c4b',
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

  -- use {'beloglazov/vim-textobj-quotes', event = 'BufEnter'}
  use { 'lukas-reineke/indent-blankline.nvim', event = 'BufEnter' }

  -- theme / colorscheme
  use { 'Yazeed1s/minimal.nvim' }
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
      require 'kanagawa'.setup({ dimInactive = true, globalStatus = true })
      vim.cmd("colorscheme kanagawa")
    end
  }

  use { 'mrjones2014/legendary.nvim', config = function()
    require('legendary').setup({
      commands = {
        -- easily create user commands
        { ':SayHello', function() print('hello world!') end, description = 'Say hello as a command' },
      },
    });
  end }

  use {
    "akinsho/toggleterm.nvim",
    disable = true,
    config = function()
      require("toggleterm").setup {
        open_mapping = [[<c-\>]],
        shell = '/bin/zsh'
      }
      -- vim.api.nvim_set_keymap("n", "<leader>x", ":ToggleTerm<CR>", {})
    end
  }

  use { 'tpope/vim-scriptease' }
  use { 'tpope/vim-fugitive' }
  use { 'tpope/vim-rhubarb' }
  -- use { 'tpope/vim-eunuch' }
  use { 'tpope/vim-surround' }
  use { 'tpope/vim-endwise', commit = '79a339' }
  -- use { 'rstacruz/vim-closer' }

  use { 'ldelossa/buffertag' }

  -- https://www.reddit.com/r/neovim/comments/wl7413/winpicknvim_plugin_for_picking_a_window/
  use { 'gbrlsnchs/winpick.nvim', config = config.config_winpick }

  -- colorscheme
  use {
    'shaunsingh/nord.nvim',
    disable = true,
    config = function()
      vim.cmd [[colorscheme nord]]
    end
  }
  use {
    'kvrohit/mellow.nvim',
    disable = true,
    config = function()
      vim.g.mellow_italic_comments = false
      vim.cmd [[colorscheme mellow]]
    end
  }
  use {
    -- 8/10
    'glepnir/zephyr-nvim',
    disable = true,
    -- branch = 'haishan',
    config = function()
      vim.cmd [[colorscheme zephyr]]
    end
  }
  -- current
  use {
    'JoosepAlviste/palenightfall.nvim',
    config = function()
      require('palenightfall').setup()
      -- vim.cmd [[colorscheme palenightfall]]
    end
  }
  use {
    -- 7/10
    'catppuccin/nvim',
    as = 'catppuccin',
    disable = true,
    config = function()
      vim.g.catppuccin_flavour = "macchiato"
      require("catppuccin").setup()
      vim.cmd [[colorscheme catppuccin]]
    end
  }
end

return require('packer').startup(startup)
