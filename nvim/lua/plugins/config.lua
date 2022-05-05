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
      file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
      grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
      qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
    },
    extensions = {
      fzy_native = {
        override_generic_sorter = false,
        override_file_sorter = true,
      }
    }
  }
  require('telescope').load_extension('fzy_native')
  require('telescope').load_extension('coc')
  -- require'telescope'.load_extension('dotfiles')
  -- require'telescope'.load_extension('gosource')

  -- vim.api.nvim_set_keymap('n', '<c-p>', '<cmd>Telescope find_files<cr>', { noremap = true, silent = true })
end

function M.config_galaxyline()
  local gl = require("galaxyline")
  local ico = require("nvim-nonicons")
  local gls = gl.section
  local sl = gl.section.short_line_left;

  gl.short_line_list = {"NvimTree", "LuaTree", "vista", "dbui"}

  local fileinfo = require('galaxyline.provider_fileinfo')
  local vcs = require('galaxyline.provider_vcs')

  local colors = {
    bg = "#282c34",
    line_bg = "#282c34",
    fg = "#D8DEE9",
    fg_green = "#65a380",
    yellow = "#A3BE8C",
    cyan = "#22262C",
    darkblue = "#61afef",
    green = "#BBE67E",
    orange = "#FF8800",
    purple = "#252930",
    magenta = "#c678dd",
    blue = "#22262C",
    red = "#DF8890",
    lightbg = "#3C4048",
    nord = "#81A1C1",
    greenYel = "#EBCB8B",
    gray1 = "#a0a0a0",
  }

  local symbols = {
    round = { right = "", left = "" },
    space = " ",
  }

  local providers = {
    space = function() return " " end,
    round = {
      left = function() return symbols.round.left end;
      right = function() return symbols.round.right end;
    }
  }

  local mode_x = {
    -- normal
    n = { b = colors.red      , i = ico.get("vim-normal-mode") },
    -- insert
    i = { b = colors.green    , i = ico.get("vim-insert-mode") },
    -- command
    c = { b = colors.yellow   , i = ico.get("vim-command-mode") },
    -- visual
    V = { b = colors.nord     , i = ico.get("vim-visual-mode") },
    -- replace
    R = { b = colors.magenta  , i = ico.get("vim-replace-mode") },
    -- select
    s = { b = colors.orange  , i = ico.get("vim-select-mode") },
    -- terminal
    t = { b = colors.blue  , i = ico.get("vim-terminal-mode") },
  }
  -- s select by char, S select by line
  mode_x["S"] = mode_x.s
  mode_x["v"] = mode_x.V
  mode_x[""] = mode_x.V

  local function hl(group, bg, fg, gui)
    local cmd = string.format('highlight %s guibg=%s guifg=%s', group, bg, fg)
    -- if gui ~= nil then cmd = cmd .. ' gui=' .. gui end
    vim.cmd(cmd)
  end

  local checkwidth = function()
    local squeeze_width = vim.fn.winwidth(0) / 2
    if squeeze_width > 40 then
      return true
    end
    return false
  end

  local i = 1
  local j = 1

  gls.left[i] = {
    ViModeO = {
      provider = providers.round.left,
    }
  }

  i = i + 1
  gls.left[i] = {
    -- main
    ViModeM = {
      provider = function()
        local m = mode_x[vim.fn.mode()]
        -- if we don't find a match, use the mode string
        if m == nil then
          return vim.fn.mode();
        end
        --                                  red           black
        -- highlight GalaxyHaishanViMode guibg=#BBE67E guifg=#282c34
        -- highlight GalaxyHaishanViModeInv guifg=#BBE67E
        hl('GalaxyViModeM', m.b, '#282c34')
        hl('GalaxyViModeO', "NONE", m.b)
        hl('GalaxyViModeC', "NONE", m.b)
        return " " .. m.i .. " "
      end,
    }
  }

  i = i + 1
  gls.left[i] = {
    ViModeC = {
      provider = providers.round.right,
    }
  }

  i = i + 1
  gls.left[i] = {
    FileIconOpenLeadSpace = {
      provider = providers.space,
    }
  }

  i = i + 1;
  gls.left[i] = {
    FileIconOpen = {
      provider = providers.round.left,
      condition = buffer_not_empty,
      -- highlight = {colors.lightbg, colors.bg}
      highlight = {colors.lightbg}
    }
  }

  i = i + 1;
  gls.left[i] = {
    FileIcon = {
      provider = "FileIcon",
      condition = buffer_not_empty,
      highlight = {fileinfo.get_file_icon_color, colors.lightbg}
    }
  }

  sl[j] = {
    FileNameSlOpen = {
      provider = providers.round.left,
      condition = buffer_not_empty,
      -- highlight = {colors.lightbg, colors.bg}
      highlight = {colors.lightbg}
    }
  }

  j = j + 1;
  sl[j] = {
    FileNameSl = {
      -- provider = {"FileName", "FileSize"},
      condition = buffer_not_empty,
      highlight = {colors.gray1, colors.lightbg},
      provider = function()
        if #vim.fn.expand '%:p' == 0 then
          return '-'
        end
        local f = vim.fn.expand '%:~'
        if vim.fn.winwidth(0) - 8 > #f then
          return vim.fn.expand '%:~'
        else
          return vim.fn.expand '%:t'
        end
      end
    }
  }

  j = j + 1;
  sl[j] = {
    FileNameSlClose = {
      provider = providers.round.right,
      condition = buffer_not_empty,
      highlight = {colors.lightbg}
    }
  }

  i = i + 1;
  gls.left[i] = {
    FileName = {
      provider = {"FileName", "FileSize"},
      condition = buffer_not_empty,
      highlight = {colors.fg, colors.lightbg}
    }
  }

  i = i + 1;
  gls.left[i] = {
    teech = {
      provider = providers.round.right,
      separator = " ",
      highlight = {colors.lightbg}
    }
  }

  i = i + 1;
  gls.left[i] = {
    DiffAdd = {
      provider = "DiffAdd",
      condition = checkwidth,
      icon = "  ",
      -- highlight = {colors.green, colors.line_bg}
      highlight = {colors.green}
    }
  }

  i = i + 1;
  gls.left[i] = {
    DiffModified = {
      provider = "DiffModified",
      condition = checkwidth,
      icon = " ",
      -- highlight = {colors.orange, colors.line_bg}
      highlight = {colors.orange}
    }
  }

  i = i + 1;
  gls.left[i] = {
    DiffRemove = {
      provider = "DiffRemove",
      condition = checkwidth,
      icon = " ",
      -- highlight = {colors.red, colors.line_bg}
      highlight = {colors.red}
    }
  }

  i = i + 1;
  gls.left[i] = {
    LeftEnd = {
      provider = providers.space,
      separator = " ",
      -- separator_highlight = {colors.line_bg, colors.line_bg},
      -- highlight = {colors.line_bg, colors.line_bg}
      -- highlight = {colors.line_bg}
    }
  }

  i = i + 1;
  gls.left[i] = {
    DiagnosticError = {
      provider = "DiagnosticError",
      icon = "  ",
      -- highlight = {colors.red, colors.bg}
      highlight = {colors.red}
    }
  }

--   i = i + 1;
--   gls.left[i] = {
--     Space = {
--       provider = providers.space,
--       highlight = {colors.line_bg, colors.line_bg}
--     }
--   }

  i = i + 1;
  gls.left[i] = {
    DiagnosticWarn = {
      provider = "DiagnosticWarn",
      icon = "  ",
      -- highlight = {colors.blue, colors.bg}
      highlight = {colors.blue}
    }
  }

  i = 1
  gls.right[i] = {
    GitIcon = {
      provider = providers.space,
      icon = "",
      condition = vcs.check_git_workspace,
      -- highlight = {colors.green, colors.line_bg}
      highlight = {colors.green}
    }
  }

  i = i + 1;
  gls.right[i] = {
    GitBranch = {
      provider = "GitBranch",
      condition = vcs.check_git_workspace,
      -- highlight = {colors.green, colors.line_bg}
      highlight = {colors.green}
    }
  }

  i = i + 1;
  gls.right[i] = {
    PerCentLeadSpace = {
      provider = providers.space,
    }
  }

  i = i + 1;
  gls.right[i] = {
    PerCentOpen = {
      provider = providers.round.left,
      -- highlight = {colors.fg, colors.bg},
      highlight = {colors.fg},
    }
  }

  i = i + 1;
  gls.right[i] = {
    PerCent = {
      provider = function()
        return string.format(' %s%s', fileinfo.line_column(), fileinfo.current_line_percent())
      end,
      separator = "",
      separator_highlight = {colors.red, colors.red},
      highlight = {colors.bg, colors.fg}
    }
  }

  i = i + 1;
  gls.right[i] = {
    PerCentOpenClose = {
      provider = providers.round.right,
      highlight = {colors.fg}
    }
  }
end

function M.config_sunjon_shade()
  require('shade').setup({
    overlay_opacity = 85,
  })
end

function M.config_hop() 
  require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }

  vim.api.nvim_set_keymap('', 'f', ':HopChar1<CR>', {})
  vim.api.nvim_set_keymap('n', 's', ":HopChar2<CR>", {})
  vim.api.nvim_set_keymap('', '<leader>j', ":HopLine<CR>", { noremap = true, silent = true })
end

function M.setup_telescope()
  vim.api.nvim_set_keymap('n', '<c-a>', [[<cmd>Telescope buffers show_all_buffers=true<cr>]], {silent=true})
  vim.api.nvim_set_keymap('n', '<c-s>', [[<cmd>Telescope git_files<cr>]], {silent=true})
  vim.api.nvim_set_keymap('n', '<c-d>', [[<cmd>Telescope find_files<cr>]], {silent=true})
  vim.api.nvim_set_keymap('n', '<c-g>', [[<cmd>Telescope live_grep<cr>]], {silent=true})
end


function M.config_lsp()
  local lsp_installer = require("nvim-lsp-installer")
  lsp_installer.setup {}

  local lspconfig = require('lspconfig')

  -- https://github.com/neovim/nvim-lspconfig/wiki/UI-Customization
  vim.diagnostic.config({ virtual_text = true, signs = true, underline = false })

  -- Use an on_attach function to only map the following keys
  -- after the language server attaches to the current buffer
  local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    -- Enable completion triggered by <c-x><c-o>
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    local opts = { noremap=true, silent=true }

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
    buf_set_keymap('n', '[x', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']x', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    buf_set_keymap('n', '<space>h', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  end

  local ts_on_attach = function(client, bufnr)
    on_attach(client, bufnr)

    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false

    local ts_utils = require("nvim-lsp-ts-utils")
    ts_utils.setup{}
    ts_utils.setup_client(client)

    vim.api.nvim_buf_set_keymap(bufnr, "n", "gs", ":TSLspOrganize<CR>", { silent = true })
    vim.api.nvim_buf_set_keymap(bufnr, "n", "qq", ":TSLspFixCurrent<CR>", { silent = true })
    -- vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", ":TSLspRenameFile<CR>", { silent = true })
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", ":TSLspImportAll<CR>", { silent = true }) 

    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
      vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false,
        signs = true,
        -- delay update diagnostics
        -- update_in_insert = false,
      }
    )

    -- https://en.wikipedia.org/wiki/Box-drawing_character
    local border = {
          {"┌", "FloatBorder"},
          {"─", "FloatBorder"},
          {"┐", "FloatBorder"},
          {"│", "FloatBorder"},
          {"┘", "FloatBorder"},
          {"─", "FloatBorder"},
          {"└", "FloatBorder"},
          {"│", "FloatBorder"},
    }

    -- vim.cmd [[autocmd! ColorScheme * highlight NormalFloat guibg=NONE cterm=NONE]]

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
      vim.lsp.handlers.hover, {border = border}
    )

  end

  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- local opts = {
  --   flags = { debounce_text_changes = 200 },
  --   capabilities = capabilities
  -- }

  lspconfig.tsserver.setup {
    on_attach = ots_on_attach, capabilities = capabilities,
    flags = { debounce_text_changes = 300 },
  }
  lspconfig.eslint.setup {
    on_attach = function (client, bufnr) client.resolved_capabilities.document_formatting = true end,
    settings = { format = { enable = true } },
    flags = { debounce_text_changes = 300 },
  }
  lspconfig.svelte.setup { on_attach = on_attach, capabilities = capabilities }

  -- print(server.name .. ' loaded')

  -- Use a loop to conveniently call 'setup' on multiple servers and
  -- map buffer local keybindings when the language server attaches
  --
  -- local servers = { 'tsserver', 'eslint', 'svelte', 'cssls', 'bashls' }
  -- for _, lsp in ipairs(servers) do
  --   nvim_lsp[lsp].setup {
  --     on_attach = on_attach,
  --     flags = {
  --       debounce_text_changes = 150,
  --     }
  --   }
  -- end
end

function M.config_cmp()
  local cmp = require'cmp'
  local kind_icons = {
    Text = "",
    Method = "",
    Function = "",
    Constructor = "",
    Field = "",
    Variable = "",
    Class = "ﴯ",
    Interface = "",
    Module = "",
    Property = "ﰠ",
    Unit = "",
    Value = "",
    Enum = "",
    Keyword = "",
    Snippet = "",
    Color = "",
    -- File = "",
    File = "",
    Reference = "",
    Folder = "",
    EnumMember = "",
    Constant = "",
    Struct = "",
    Event = "",
    Operator = "",
    TypeParameter = ""
  }

  cmp.setup({
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
        -- Source
        vim_item.menu = ({
          buffer = "[Buffer]",
          nvim_lsp = "[LSP]",
          luasnip = "[LuaSnip]",
          nvim_lua = "[Lua]",
          latex_symbols = "[LaTeX]",
        })[entry.source.name]
        return vim_item
      end
    },
    mapping = {
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping.complete(),
      -- ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      -- ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
      ['<Tab>'] = function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        -- elseif luasnip.expand_or_jumpable() then
        --   luasnip.expand_or_jump()
        else
          fallback()
        end
      end,
      ['<S-Tab>'] = function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        -- elseif luasnip.jumpable(-1) then
        --   luasnip.jump(-1)
        else
          fallback()
        end
      end,

    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'ultisnips' }, { name = 'nvim_lsp_signature_help' },
    }, {
      { name = 'buffer' }, { name = "dictionary", keyword_length = 2 }
    })
  })
  -- cmp.setup.cmdline('/', {
  --   sources = { { name = 'buffer' } },
  --   view = { entries = {name = 'wildmenu', separator = '|' } }
  -- })
  -- cmp.setup.cmdline(':', {
  --   sources = cmp.config.sources({{ name = 'path' }}, {{ name = 'cmdline' }}),
  --   view = { entries = {name = 'wildmenu', separator = '|' } }
  -- })
end

function M.config_null_ls()
  local null_ls = require("null-ls")
  null_ls.setup({
    -- filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' }
    sources = {
      -- null_ls.builtins.formatting.stylua,
      -- null_ls.builtins.completion.spell,
      null_ls.builtins.formatting.prettier,
    },
  })
  -- require("lspconfig")["null-ls"].setup({})
end

return M
