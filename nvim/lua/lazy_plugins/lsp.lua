return {
  {
    "VonHeikemen/lsp-zero.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      -- lsp support
      "neovim/nvim-lspconfig",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      -- autocompletion
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      -- snippets
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",
    },
    config = function()
      -- python: pywright
      local lsp = require('lsp-zero')
      lsp.preset('recommended')
      lsp.on_attach(function(_ --[[ client ]], bufnr)
        local opts = { buffer = bufnr, remap = false }
        local bind = vim.keymap.set

        bind('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
        -- bind('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
        bind('n', '<space>ca', '<cmd>:Lspsaga code_action<CR>', opts)
        -- bind('n', 'gp', vim.lsp.buf.format({ async = true }), opts)
        bind('n', 'gp', function() vim.lsp.buf.format({ async = true }) end, opts)
      end)
      lsp.ensure_installed({ 'tsserver', 'eslint', 'cssls', 'svelte', 'rust_analyzer' })
      lsp.nvim_workspace()
      lsp.setup()
      -- https://github.com/neovim/nvim-lspconfig/wiki/UI-Customization
      vim.diagnostic.config({
        virtual_text = { spacing = 4, prefix = '○' },
        update_in_insert = false,
        severity_sort = true,
        signs = true,
        underline = false,
      })
      -- load snippets from path/of/your/nvim/config/my-cool-snippets
      require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./vscode-snips" } })
    end,
  },


  -- {
  --   'VonHeikemen/lsp-zero.nvim',
  --   branch = 'v2.x',
  --   lazy = true,
  --   config = function()
  --     -- This is where you modify the settings for lsp-zero
  --     -- Note: autocompletion settings will not take effect
  --     -- require('lsp-zero.settings').preset('recommended')
  --     require('lsp-zero.settings').preset({})
  --   end
  -- },
  --
  -- -- Autocompletion
  -- {
  --   'hrsh7th/nvim-cmp',
  --   event = 'InsertEnter',
  --   dependencies = {
  --     "hrsh7th/nvim-cmp",
  --     "hrsh7th/cmp-buffer",
  --     "hrsh7th/cmp-path",
  --     "saadparwaiz1/cmp_luasnip",
  --     "hrsh7th/cmp-nvim-lsp",
  --     "hrsh7th/cmp-nvim-lua",
  --     'L3MON4D3/LuaSnip',
  --     'rafamadriz/friendly-snippets',
  --   },
  --   config = function()
  --     -- Here is where you configure the autocompletion settings.
  --     -- The arguments for .extend() have the same shape as `manage_nvim_cmp`:
  --     -- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v2.x/doc/md/api-reference.md#manage_nvim_cmp
  --     require('lsp-zero.cmp').extend()
  --     -- set_sources = 'recommended',
  --
  --     -- And you can configure cmp even more, if you want to.
  --     local cmp = require('cmp')
  --     local cmp_action = require('lsp-zero.cmp').action()
  --
  --     cmp.setup({
  --       sources = {
  --         { name = 'path' },
  --         { name = 'nvim_lsp' },
  --         { name = 'buffer',  keyword_length = 3 },
  --         { name = 'luasnip', keyword_length = 2 },
  --       },
  --       mapping = {
  --         ['<CR>'] = cmp.mapping.confirm({select = false}),
  --         -- ['<C-Space>'] = cmp.mapping.complete(),
  --         ['<C-f>'] = cmp_action.luasnip_jump_forward(),
  --         ['<C-b>'] = cmp_action.luasnip_jump_backward(),
  --       }
  --     })
  --   end
  -- },
  --
  -- -- LSP
  -- {
  --   'neovim/nvim-lspconfig',
  --   cmd = 'LspInfo',
  --   event = { 'BufReadPre', 'BufNewFile' },
  --   dependencies = {
  --     { 'hrsh7th/cmp-nvim-lsp' },
  --     { 'williamboman/mason-lspconfig.nvim' },
  --     {
  --       'williamboman/mason.nvim',
  --       build = function()
  --         pcall(vim.cmd, 'MasonUpdate')
  --       end,
  --     },
  --   },
  --   config = function()
  --     -- This is where all the LSP shenanigans will live
  --
  --     local lsp = require('lsp-zero').preset('recommended')
  --
  --     lsp.on_attach(function(client, bufnr)
  --       lsp.default_keymaps({ buffer = bufnr })
  --       -- local opts = { buffer = bufnr, remap = false }
  --       -- local bind = vim.keymap.set
  --       --
  --       -- bind('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  --       -- bind('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  --     end)
  --     lsp.ensure_installed({ 'tsserver', 'eslint', 'cssls', 'svelte', 'rust_analyzer' })
  --     lsp.nvim_workspace()
  --
  --     -- (Optional) Configure lua language server for neovim
  --     require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
  --
  --     lsp.setup()
  --
  --     -- https://github.com/neovim/nvim-lspconfig/wiki/UI-Customization
  --     vim.diagnostic.config({
  --       virtual_text = { spacing = 4, prefix = '○' },
  --       update_in_insert = false,
  --       severity_sort = true,
  --       signs = true,
  --       underline = false,
  --     })
  --     -- load snippets from path/of/your/nvim/config/my-cool-snippets
  --     require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./vscode-snips" } })
  --   end
  -- }
}
