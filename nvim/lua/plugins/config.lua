local M = {}

-- https://github.com/b3nj5m1n/kommentary
function M.config_kommentary()
  require('kommentary.config').configure_language("typescript", {
    prefer_single_line_comments = true,
    --[[ single_line_comment_string = "//",
    multi_line_comment_strings = {"/*", "*/"}, ]]
  })
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
    greenYel = "#EBCB8B"
  }

  local mode_x = {
    -- normal
    n = { b = colors.red      , i = ico.get("vim-normal-mode") },
    -- insert
    i = { b = colors.green    , i = ico.get("vim-insert-mode") },
    -- command
    c = { b = colors.yellow     , i = ico.get("vim-command-mode") },
    -- visual
    V = { b = colors.nord     , i = ico.get("vim-visual-mode") },
    -- replace
    R = { b = colors.magenta  , i = ico.get("vim-select-mode") },
  }

  mode_x["v"] = mode_x.V
  mode_x[""] = mode_x.V

  local function hlMain(group, bg, fg, gui)
    local cmd = string.format('highlight %s guibg=%s guifg=%s', group, bg, fg)
    -- if gui ~= nil then cmd = cmd .. ' gui=' .. gui end
    vim.cmd(cmd)
  end

  local function hlPrimary(group, fg, gui)
    local cmd = string.format('highlight %s guifg=%s', group, fg)
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

  gls.left[i] = {
    leftRounded = {
      provider = function() return "" end,
      highlight = {colors.nord, colors.bg}
    }
  }

  i = i + 1;
  gls.left[i] = {
    ViMode = {
      provider = function() return ico.get("rust").." " end,
      highlight = {colors.bg, colors.nord},
      separator = " ",
      separator_highlight = {colors.lightbg, colors.lightbg}
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
      provider = function() return "" end,
      separator = " ",
      separator_highlight = {colors.lightbg, colors.bg},
      highlight = {colors.lightbg, colors.bg}
    }
  }

  i = i + 1;
  gls.left[i] = {
    DiffAdd = {
      provider = "DiffAdd",
      condition = checkwidth,
      icon = "  ",
      highlight = {colors.green, colors.line_bg}
    }
  }

  i = i + 1;
  gls.left[i] = {
    DiffModified = {
      provider = "DiffModified",
      condition = checkwidth,
      icon = " ",
      highlight = {colors.orange, colors.line_bg}
    }
  }

  i = i + 1;
  gls.left[i] = {
    DiffRemove = {
      provider = "DiffRemove",
      condition = checkwidth,
      icon = " ",
      highlight = {colors.red, colors.line_bg}
    }
  }

  i = i + 1;
  gls.left[i] = {
    LeftEnd = {
      provider = function() return " " end,
      separator = " ",
      separator_highlight = {colors.line_bg, colors.line_bg},
      highlight = {colors.line_bg, colors.line_bg}
    }
  }

  i = i + 1;
  gls.left[i] = {
    DiagnosticError = {
      provider = "DiagnosticError",
      icon = "  ",
      highlight = {colors.red, colors.bg}
    }
  }

  i = i + 1;
  gls.left[i] = {
    Space = {
      provider = function() return " " end,
      highlight = {colors.line_bg, colors.line_bg}
    }
  }

  i = i + 1;
  gls.left[i] = {
    DiagnosticWarn = {
      provider = "DiagnosticWarn",
      icon = "  ",
      highlight = {colors.blue, colors.bg}
    }
  }

  i = 1
  gls.right[i] = {
    GitIcon = {
      provider = function() return " " end,
      icon = "",
      condition = vcs.check_git_workspace,
      highlight = {colors.green, colors.line_bg}
    }
  }

  i = i + 1;
  gls.right[i] = {
    GitBranch = {
      provider = "GitBranch",
      condition = vcs.check_git_workspace,
      highlight = {colors.green, colors.line_bg}
    }
  }

  i = i + 1;
  gls.right[i] = {
    HaishanViModeInv = {
      provider = function() return "" end,
      -- separator = " ",
      -- separator_highlight = {colors.bg, colors.bg},
      -- highlight = {colors.red, colors.bg}
      -- highlight = HaishanViModeInv
    }
  }

  i = i + 1;
  gls.right[i] = {
    HaishanViMode = {
      provider = function()

        local m = mode_x[vim.fn.mode()]

        -- blue orange
        --                               red           black
        -- highlight GalaxyHaishanViMode guibg=#BBE67E guifg=#282c34
        -- highlight GalaxyHaishanViModeInv guifg=#BBE67E

        hlMain('GalaxyHaishanViMode', m.b, '#282c34')
        hlPrimary('GalaxyHaishanViModeInv', m.b)
        return m.i .. " "
      end,

      -- highlight = {colors.bg, colors.red}
    }
  }

  -- i = i + 1;
  -- gls.right[i] = {
  --   PerCentLeftRound = {
  --     provider = function() return "" end,
  --     highlight = {colors.fg, colors.bg}
  --   }
  -- }

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
    rightRounded = {
      provider = function() return "" end,
      highlight = {colors.fg, colors.bg}
    }
  }
end

function M.config_sunjon_shade()
  require('shade').setup({
    overlay_opacity = 80
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

return M
