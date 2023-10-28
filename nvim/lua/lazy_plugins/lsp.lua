return {
  {
    'williamboman/mason.nvim',
    lazy = false,
    config = true,
  },
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    -- these dependencies will only be loaded when cmp loads
    -- dependencies are always lazy-loaded unless specified otherwise
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      'L3MON4D3/LuaSnip',
      'uga-rosa/cmp-dictionary',
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
      -- { dir = "/Users/HHan13/tmp/cmp-emoji" },
      --     "hrsh7th/cmp-nvim-lua",
      --     _hash_
    },
    config = function()
      local cmp = require('cmp')
      cmp.setup({
        sources = {
          { name = 'path' },
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'nvim_lsp_signature_help' },
          -- { name = 'haishan' },
          { name = "dictionary",             keyword_length = 2 },
          {
            name = 'buffer',
            option = {
              get_bufnrs = function()
                return vim.api.nvim_list_bufs()
                -- local buf = vim.api.nvim_get_current_buf()
                -- local byte_size = vim.api.nvim_buf_get_offset(buf, vim.api.nvim_buf_line_count(buf))
                -- if byte_size > 1024 * 1024 then -- 1 Megabyte max
                --   return {}
                -- end
                -- return { buf }
              end
            }
          },
        },
        mapping = cmp.mapping.preset.insert({
          -- Enter key confirms completion item
          ['<CR>'] = cmp.mapping.confirm({ select = false }),

          -- Ctrl + space triggers completion menu
          ['<C-Space>'] = cmp.mapping.complete(),
        }),
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
      })

      local dict = require("cmp_dictionary")
      dict.switcher({
        filetype = {
          lua = { "~/repo/h/dotfiles/nvim/dict/one.dict" },
          -- javascript = { "/path/to/js.dict", "/path/to/js2.dict" },
        },
        -- filepath = {
        --   [".*xmake.lua"] = { "/path/to/xmake.dict", "/path/to/lua.dict" },
        --   ["%.tmux.*%.conf"] = { "/path/to/js.dict", "/path/to/js2.dict" },
        -- },
        -- spelllang = {
        --   en = "/path/to/english.dict",
        -- },
      })

      require("luasnip.loaders.from_vscode").load()
      -- require("luasnip.loaders.from_lua").load({paths = "~/snippets"})
      require("luasnip.loaders.from_vscode").lazy_load({paths = "~/dotfiles/vscodesnips"})

      -- -- Here is where you configure the autocompletion settings.
      -- local lsp_zero = require('lsp-zero')
      -- lsp_zero.extend_cmp()
      --
      -- -- And you can configure cmp even more, if you want to.
      -- local cmp = require('cmp')
      -- local cmp_action = lsp_zero.cmp_action()
      --
      -- cmp.setup({
      --   formatting = lsp_zero.cmp_format(),
      --   mapping = cmp.mapping.preset.insert({
      --     ['<C-Space>'] = cmp.mapping.complete(),
      --     ['<C-u>'] = cmp.mapping.scroll_docs(-4),
      --     ['<C-d>'] = cmp.mapping.scroll_docs(4),
      --     ['<C-f>'] = cmp_action.luasnip_jump_forward(),
      --     ['<C-b>'] = cmp_action.luasnip_jump_backward(),
      --   })
      -- })
    end
  },
  {
    'neovim/nvim-lspconfig',
    cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'williamboman/mason-lspconfig.nvim' },
    },
    config = function()
      -- -- This is where all the LSP shenanigans will live
      -- local lsp_zero = require('lsp-zero')
      -- lsp_zero.extend_lspconfig()
      --
      -- lsp_zero.on_attach(function(client, bufnr)
      --   -- see :help lsp-zero-keybindings
      --   -- to learn the available actions
      --   lsp_zero.default_keymaps({buffer = bufnr})
      -- end)

      local lspconfig = require('lspconfig')
      local lsp_defaults = lspconfig.util.default_config

      lsp_defaults.capabilities = vim.tbl_deep_extend(
        'force',
        lsp_defaults.capabilities,
        require('cmp_nvim_lsp').default_capabilities()
      )

      vim.api.nvim_create_autocmd('LspAttach', {
        desc = 'LSP actions',
        callback = function(event)
          local opts = { buffer = event.buf }

          vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
          vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', {
            buffer = event.buf,
            desc = "go to definition"
          })
          vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
          vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
          vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
          vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
          vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
          vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
          vim.keymap.set('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
          vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)

          -- vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
          -- vim.keymap.set('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', {
          vim.keymap.set('n', '<leader>ca', '<cmd>:Lspsaga code_action<CR>', {
            buffer = event.buf,
            desc = "code action"
          })

          -- vim.keymap.set('n', '<leader>rn', '<cmd>:Lspsaga rename<CR>', { desc = "rename" })

          vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)
          vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>', opts)
          vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>', opts)
          vim.keymap.set('n', 'gp', function() vim.lsp.buf.format({ async = true }) end, {
            buffer = event.buf,
            desc = "format buffer"
          })
        end
      })

      local default_setup = function(server_name)
        lspconfig[server_name].setup({})
      end

      require('mason-lspconfig').setup({
        automatic_installation = true,
        -- ensure_installed = {},
        ensure_installed = { 'tsserver', 'rust_analyzer', 'eslint', 'cssls', 'svelte', 'lua_ls' },
        -- see `:h mason-lspconfig.setup_handlers()`
        handlers = {
          default_setup,
          -- ["rust_analyzer"] = function ()
          --     require("rust-tools").setup {}
          -- end,
          ["lua_ls"] = function()
            lspconfig.lua_ls.setup {
              settings = {
                Lua = {
                  diagnostics = {
                    globals = { "vim" }
                  }
                }
              }
            }
          end,
        },
        -- handlers = {
        --   lsp_zero.default_setup,
        --   lua_ls = function()
        --     -- (Optional) Configure lua language server for neovim
        --     local lua_opts = lsp_zero.nvim_lua_ls()
        --     require('lspconfig').lua_ls.setup(lua_opts)
        --   end,
        -- }
      })

      -- lsp_zero.setup_servers({ 'tsserver', 'rust_analyzer', 'eslint', 'cssls', 'svelte', 'lua_ls' })
      -- -- require('lspconfig').lua_ls.setup({})
      -- -- require('lspconfig').rust_analyzer.setup({})
    end
  },

  {
    "j-hui/fidget.nvim",
    tag = "legacy",
    event = "LspAttach",
    opts = {
      -- options
    },
  },

  {
    'nvimdev/lspsaga.nvim',
    cmd = { 'Lspsaga' },
    config = function()
      require('lspsaga').setup({
        lightbulb = {
          sign = false,
          debounce = 100,
        }
      })
    end,
  },
}
