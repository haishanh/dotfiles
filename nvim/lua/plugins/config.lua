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
    buf_set_keymap('n', '[x', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']x', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
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
    on_attach = ts_on_attach, capabilities = capabilities,
    flags = { debounce_text_changes = 300 },
  }
  lspconfig.eslint.setup {
    on_attach = function (client, bufnr) client.resolved_capabilities.document_formatting = false end,
    settings = { format = { enable = true } },
    flags = { debounce_text_changes = 300 },
  }
  lspconfig.svelte.setup { on_attach = on_attach, capabilities = capabilities }

  -- print(server.name .. ' loaded')
end

function M.config_cmp()
  local cmp = require'cmp'
  local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
  end
  local icons = require "nvim-nonicons"
  local kind_icons = {
    Text = icons.get("text"),
    Method = icons.get("package"),
    -- Method = "",
    Function = '',
    Constructor = "",
    -- Field = "",
    Field = icons.get("field"),
    Variable = icons.get("code-square"),
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
    Constant = icons.get("constant"),
    Struct = icons.get("struct"),
    Event = "",
    Operator = "",
    TypeParameter = ""
  }

  cmp.setup({
    experimental = {
      -- native_menu = false,
      ghost_text = false,
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
        })[entry.source.name]
        return vim_item
      end
    },
    mapping = {
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
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
                  return vim.api.nvim_feedkeys( t("<Plug>(ultisnips_jump_backward)"), 'm', true)
              else
                  fallback()
              end
          end,
          s = function(fallback)
              if vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
                  return vim.api.nvim_feedkeys( t("<Plug>(ultisnips_jump_backward)"), 'm', true)
              else
                  fallback()
              end
          end
      }),
      ['<Down>'] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }), {'i'}),
      ['<Up>'] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }), {'i'}),
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
      -- ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), {'i', 'c'}),
      -- ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), {'i', 'c'}),
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      -- ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-f>'] = cmp.mapping({ i = cmp.mapping.scroll_docs(4), c = cmp.mapping.scroll_docs(4) }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), {'i', 'c'}),
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
      { name = 'nvim_lsp' }, { name = 'ultisnips' }, { name = 'nvim_lsp_signature_help' }, { name = 'buffer' }
    }, {
      { name = "dictionary", keyword_length = 2 }
    })
  })

  -- cmp.setup.cmdline('/', {
  --   sources = { { name = 'buffer' } },
  --   view = { entries = {name = 'wildmenu', separator = '|' } }
  -- })
  cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = "path" },
    }, {
        { name = "cmdline" },
    }),
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
      null_ls.builtins.formatting.prettier,
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

return M
