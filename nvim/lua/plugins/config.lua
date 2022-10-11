local M = {}

-- https://github.com/b3nj5m1n/kommentary
function M.config_kommentary()
  -- require('kommentary.config').configure_language({"typescript", "zig"}, {
  --   prefer_single_line_comments = true,
  --   single_line_comment_string = 'auto',
  --   multi_line_comment_strings = 'auto',
  --   hook_function = function()
  --     require('ts_context_commentstring.internal').update_commentstring()
  --   end,
  -- })
  vim.api.nvim_set_keymap("n", "gcc", "<Plug>kommentary_line_default", {})
  vim.api.nvim_set_keymap("n", "gc", "<Plug>kommentary_motion_default", {})
  vim.api.nvim_set_keymap("v", "gc", "<Plug>kommentary_visual_default<C-c>", {})
end

function M.config_telescope()
  -- if not packer_plugins['plenary.nvim'].loaded then
  --   vim.cmd [[packadd plenary.nvim]]
  --   vim.cmd [[packadd popup.nvim]]
  --   vim.cmd [[packadd telescope-fzy-native.nvim]]
  -- end
  require('telescope').setup {
    defaults = {
      prompt_prefix = '🔭 ',
      -- prompt_position = 'top',
      selection_caret = "🧶",
      sorting_strategy = 'descending',
      file_previewer = require 'telescope.previewers'.vim_buffer_cat.new,
      grep_previewer = require 'telescope.previewers'.vim_buffer_vimgrep.new,
      qflist_previewer = require 'telescope.previewers'.vim_buffer_qflist.new,
    },
    extensions = {
      fzy_native = {
        override_generic_sorter = false,
        override_file_sorter = true,
      }
    }
  }
  require('telescope').load_extension('fzy_native')
  -- require('telescope').load_extension('coc')
  -- require('telescope').load_extension('coc')
  -- require'telescope'.load_extension('dotfiles')
  -- require'telescope'.load_extension('gosource')

  -- vim.api.nvim_set_keymap('n', '<c-p>', '<cmd>Telescope find_files<cr>', { noremap = true, silent = true })
end

function M.config_sunjon_shade()
  require('shade').setup({ overlay_opacity = 85 })
end

function M.config_hop()
  require 'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }

  vim.api.nvim_set_keymap('', 'f', ':HopChar1<CR>', {})
  vim.api.nvim_set_keymap('n', 's', ":HopChar2<CR>", {})
  vim.api.nvim_set_keymap('', '<leader>j', ":HopLine<CR>", { noremap = true, silent = true })
end

function M.setup_telescope()
  vim.api.nvim_set_keymap('n', '<c-a>', [[<cmd>Telescope buffers show_all_buffers=true<cr>]], { silent = true })
  vim.api.nvim_set_keymap('n', '<c-s>', [[<cmd>Telescope git_files<cr>]], { silent = true })
  vim.api.nvim_set_keymap('n', '<c-d>', [[<cmd>Telescope find_files<cr>]], { silent = true })
  vim.api.nvim_set_keymap('n', '<c-g>', [[<cmd>Telescope live_grep<cr>]], { silent = true })
end

function M.config_lsp()
  -- local lsp_installer = require("nvim-lsp-installer")
  -- lsp_installer.setup {}
  require("mason").setup()
  require("mason-lspconfig").setup()

  local lspconfig = require('lspconfig')

  local sign = function(opts)
    vim.fn.sign_define(opts.name, {
      texthl = opts.name,
      text = opts.text,
      numhl = ''
    })
  end

  -- https://www.compart.com/en/unicode/category/So
  local sign_icon = { error = '↬', warn = '▲', hint = '⚑', info = '' }

  sign({ name = 'DiagnosticSignError', text = sign_icon.error })
  sign({ name = 'DiagnosticSignWarn', text = sign_icon.warn })
  sign({ name = 'DiagnosticSignHint', text = sign_icon.hint })
  sign({ name = 'DiagnosticSignInfo', text = sign_icon.info })

  -- https://github.com/neovim/nvim-lspconfig/wiki/UI-Customization
  vim.diagnostic.config({ virtual_text = false, signs = true, underline = false })

  -- Use an on_attach function to only map the following keys
  -- after the language server attaches to the current buffer
  local on_attach = function(_client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    -- Enable completion triggered by <c-x><c-o>
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    local opts = { noremap = true, silent = true }

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_set_keymap('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    buf_set_keymap('n', '[x', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']x', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    -- buf_set_keymap('n', '<space>h', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  end

  local ts_on_attach = function(client, bufnr)
    on_attach(client, bufnr)

    -- client.resolved_capabilities.document_formatting = false
    -- client.resolved_capabilities.document_range_formatting = false
    -- client.server_capabilities.document_formatting = false;
    -- client.server_capabilities.document_range_formatting = false

    local ts_utils = require("nvim-lsp-ts-utils")
    ts_utils.setup {}
    ts_utils.setup_client(client)

    vim.api.nvim_buf_set_keymap(bufnr, "n", "gs", ":TSLspOrganize<CR>", { silent = true })
    vim.api.nvim_buf_set_keymap(bufnr, "n", "qq", ":TSLspFixCurrent<CR>", { silent = true })
    -- vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", ":TSLspRenameFile<CR>", { silent = true })
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", ":TSLspImportAll<CR>", { silent = true })

    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
      vim.lsp.diagnostic.on_publish_diagnostics, {
      virtual_text = false,
      signs = true,
      update_in_insert = false,
      underline = true,
      severity_sort = true,
      float = {
        focusable = false,
        style = 'minimal',
        border = 'rounded',
        source = 'always',
        header = '',
        prefix = '',
      },
    }
    )

    -- https://en.wikipedia.org/wiki/Box-drawing_character
    -- also check https://github.com/nvim-telescope/telescope.nvim/blob/30e2dc5232d0dd63709ef8b44a5d6184005e8602/lua/telescope/themes.lua#L91
    local border = {
      { "┌", "FloatBorder" }, { "─", "FloatBorder" }, { "┐", "FloatBorder" }, { "│", "FloatBorder" },
      { "┘", "FloatBorder" }, { "─", "FloatBorder" }, { "└", "FloatBorder" }, { "│", "FloatBorder" },
    }

    -- vim.cmd [[autocmd! ColorScheme * highlight NormalFloat guibg=NONE cterm=NONE]]

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
    -- vim.lsp.handlers.hover, { border = "single" }
      vim.lsp.handlers.hover, { border = border }
    )
  end

  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- local opts = {
  --   flags = { debounce_text_changes = 200 },
  --   capabilities = capabilities
  -- }

  lspconfig.tsserver.setup {
    on_attach = ts_on_attach, capabilities = capabilities,
    flags = { debounce_text_changes = 300 },
  }
  lspconfig.eslint.setup {
    -- on_attach = function (client, _bufnr) client.resolved_capabilities.document_formatting = false end,
    on_attach = function(client, _bufnr) client.server_capabilities.document_formatting = false end,
    settings = { format = { enable = true } },
    flags = { debounce_text_changes = 300 },
  }
  lspconfig.cssls.setup { on_attach = on_attach, capabilities = capabilities }
  lspconfig.svelte.setup { on_attach = on_attach, capabilities = capabilities }

  require("mason-lspconfig").setup_handlers({
    ["sumneko_lua"] = function()
      lspconfig.sumneko_lua.setup {
        on_attach = on_attach,
        settings = {
          Lua = {
            diagnostics = { globals = { "vim", "use" } }
          }
        }
      }
    end,
  })

  -- print(server.name .. ' loaded')
end

function M.config_lspsaga()
  local saga = require 'lspsaga'
  saga.init_lsp_saga()
end

function M.config_cmp()
  local cmp = require 'cmp'
  local icons = require "nvim-nonicons"
  local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
  end
  local kind_icons = {
    Text = icons.get("text"),
    Method = icons.get("package"),
    Function = '',
    Constructor = "",
    Field = icons.get("field"),
    Variable = icons.get("code-square"),
    Class = "ﴯ",
    Interface = "",
    Module = "",
    Property = icons.get("tag"),
    Unit = "U",
    Value = "",
    Enum = "",
    Keyword = "",
    Snippet = icons.get("snippet"),
    Color = "",
    File = icons.get("file"),
    Reference = "",
    Folder = icons.get("file-directory"),
    EnumMember = "",
    Constant = icons.get("constant"),
    Struct = icons.get("struct"),
    Event = icons.get("zap"),
    Operator = "O",
    TypeParameter = "T"
  }

  cmp.setup({
    experimental = {
      ghost_text = true,
    },

    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },

    -- view = {
    --   entries = 'native'
    -- },

    -- completion = {
    --   autocomplete = false
    -- },
    snippet = {
      expand = function(args)
        vim.fn["UltiSnips#Anon"](args.body)
      end,
    },
    formatting = {
      format = function(entry, vim_item)
        -- Kind icons
        vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)
        -- vim_item.kind = string.format('%s', kind_icons[vim_item.kind])
        -- Source
        vim_item.menu = ({
          buffer = "[]",
          nvim_lsp = "[◍]",
          luasnip = "[LuaSnip]",
          nvim_lua = "[Lua]",
          latex_symbols = "[LaTeX]",
          dictionary = icons.get("repo"),
        })[entry.source.name]
        return vim_item
      end
    },
    mapping = {
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      -- ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      -- ['<C-f>'] = cmp.mapping({ i = cmp.mapping.scroll_docs(4), c = cmp.mapping.scroll_docs(4) }),
      ["<Tab>"] = cmp.mapping({
        c = function()
          if cmp.visible() then
            cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
          else
            cmp.complete()
          end
        end,
        i = function(fallback)
          if cmp.visible() then
            cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
          elseif vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
            vim.api.nvim_feedkeys(t("<Plug>(ultisnips_jump_forward)"), 'm', true)
          else
            fallback()
          end
        end,
        s = function(fallback)
          if vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
            vim.api.nvim_feedkeys(t("<Plug>(ultisnips_jump_forward)"), 'm', true)
          else
            fallback()
          end
        end
      }),
      ["<S-Tab>"] = cmp.mapping({
        c = function()
          if cmp.visible() then
            cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
          else
            cmp.complete()
          end
        end,
        i = function(fallback)
          if cmp.visible() then
            cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
          elseif vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
            return vim.api.nvim_feedkeys(t("<Plug>(ultisnips_jump_backward)"), 'm', true)
          else
            fallback()
          end
        end,
        s = function(fallback)
          if vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
            return vim.api.nvim_feedkeys(t("<Plug>(ultisnips_jump_backward)"), 'm', true)
          else
            fallback()
          end
        end
      }),
      ['<Down>'] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }), { 'i' }),
      ['<Up>'] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }), { 'i' }),
      ['<C-n>'] = cmp.mapping({
        c = function()
          if cmp.visible() then
            cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
          else
            vim.api.nvim_feedkeys(t('<Down>'), 'n', true)
          end
        end,
        i = function(fallback)
          if cmp.visible() then
            cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
          else
            fallback()
          end
        end
      }),
      ['<C-p>'] = cmp.mapping({
        c = function()
          if cmp.visible() then
            cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
          else
            vim.api.nvim_feedkeys(t('<Up>'), 'n', true)
          end
        end,
        i = function(fallback)
          if cmp.visible() then
            cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
          else
            fallback()
          end
        end
      }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-e>'] = cmp.mapping({ i = cmp.mapping.close(), c = cmp.mapping.close() }),
      ['<CR>'] = cmp.mapping({
        i = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false }),
        -- c = function(fallback)
        --     if cmp.visible() then
        --         cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
        --     else
        --         fallback()
        --     end
        -- end
      }),
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' }, { name = 'ultisnips' }, { name = 'nvim_lsp_signature_help' },
      {
        -- https://github.com/hrsh7th/cmp-buffer
        name = 'buffer',
        option = {
          get_bufnrs = function()
            -- return { vim.api.nvim_get_current_buf() }
            -- all buffers
            return vim.api.nvim_list_bufs()
            -- local buf = vim.api.nvim_get_current_buf()
            -- local byte_size = vim.api.nvim_buf_get_offset(buf, vim.api.nvim_buf_line_count(buf))
            -- if byte_size > 1024 * 1024 then -- 1 Megabyte max
            --   return {}
            -- end
            -- return { buf }
          end,
        }
      },
    }, {
      -- { name = "dictionary", keyword_length = 2 }
    })
  })

  -- require("cmp_dictionary").setup({
  --   dic = {
  --     ["*"] = { "/usr/share/dict/words" },
  --   }
  -- })

  require('cmp_buffer')

  -- cmp.setup.cmdline('/', {
  --   sources = { { name = 'buffer' } },
  --   view = { entries = {name = 'wildmenu', separator = '|' } }
  -- })

  cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    -- sources = cmp.config.sources({
    --   { name = "path" },
    -- }, {
    --   { name = "cmdline" },
    -- }),
    sources = cmp.config.sources({
      { name = "cmdline" },
    }),
  })

  cmp.setup.filetype({ 'nvimtree' }, {
    enabled = false,
    completion = {
      autocomplete = false
    }
  })
end

function M.config_null_ls()
  local null_ls = require("null-ls")
  local with_root_file = function(...)
    local files = { ... }
    return function(utils)
      return utils.root_has_file(files)
    end
  end

  null_ls.setup({
    -- filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' }
    sources = {
      -- null_ls.builtins.formatting.stylua,
      -- null_ls.builtins.completion.spell,
      null_ls.builtins.formatting.prettier.with({
        -- enable for all filetypes
        filetypes = {}
        -- filetypes = { "javascript", "typescript", "html", "json", "yaml", "markdown" },
      }),
      null_ls.builtins.diagnostics.eslint_d.with {
        condition = with_root_file { ".eslintrc", ".eslintrc.js", ".eslintrc.json" },
      },
      null_ls.builtins.code_actions.eslint_d.with {
        condition = with_root_file { ".eslintrc", ".eslintrc.js", ".eslintrc.json" },
      },
    },
  })
  -- require("lspconfig")["null-ls"].setup({})
end

function M.config_icons()
  -- require("nvim-web-devicons").set_default_icon('', '#6d8086')
  -- local icons = require "nvim-nonicons"
  -- require("nvim-web-devicons").set_icon {
  --   ["svelte"] = {
  --     icon = icons.get("svelte"),
  --     color = "#ff3e00",
  --     cterm_color = "202",
  --     name = "Svelte",
  --   },
  -- }
end

function M.config_winpick()
  local winpick = require "winpick"
  winpick.setup({ border = 'rounded' })
  winpick.__select = function()
    local winid, bufnr = winpick.select()
    if winid then
      vim.api.nvim_set_current_win(winid)
      print(bufnr)
    end
  end
  -- vim.api.nvim_set_keymap('n', '<c-w>', '<cmd>lua require("winpick").select()<CR>', {})
  vim.api.nvim_set_keymap('n', '<c-;>', '<cmd>lua require("winpick").__select()<CR>', {})
end

function M.config_undotree()
  -- nnoremap <leader>u :UndotreeToggle<cr>
  vim.api.nvim_set_keymap('n', '<leader>u', ':UndotreeToggle<cr>', { noremap = true })
end

return M
