function config_galaxyline()
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
      provider = {"FilePath", "FileSize"},
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

return config_galaxyline
