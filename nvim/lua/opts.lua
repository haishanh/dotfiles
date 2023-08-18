local disable_distribution_plugins = function()
  vim.g.loaded                   = 1
  vim.g.loaded_gzip              = 1
  vim.g.loaded_tar               = 1
  vim.g.loaded_tarPlugin         = 1
  vim.g.loaded_zip               = 1
  vim.g.loaded_zipPlugin         = 1
  vim.g.loaded_getscript         = 1
  vim.g.loaded_getscriptPlugin   = 1
  vim.g.loaded_vimball           = 1
  vim.g.loaded_vimballPlugin     = 1
  vim.g.loaded_matchit           = 1
  vim.g.loaded_matchparen        = 1
  vim.g.loaded_2html_plugin      = 1
  vim.g.loaded_logiPat           = 1
  vim.g.loaded_rrhelper          = 1
  vim.g.loaded_netrw             = 1
  vim.g.loaded_netrwPlugin       = 1
  vim.g.loaded_netrwSettings     = 1
  vim.g.loaded_netrwFileHandlers = 1
end

disable_distribution_plugins()

local options = {
  hidden        = true,
  showmode      = false, -- set noshowmode, hide "-- INSERT --"
  scrolloff     = 6,     --  keep some more lines for scope
  showcmd       = true,  --  show command in bottom bar
  wildmenu      = true,  -- visual autocomplete for command menu
  showmatch     = true,  -- highlight matching brackets
  lazyredraw    = true,
  -- number        = 'relativenumber',
  signcolumn    = 'number',

  termguicolors = true,
  laststatus    = 3,  -- 3 means toggle global statusline
  pumheight     = 10, -- pop up menu height
  cmdheight     = 0,

  autoread      = true,
  autowriteall  = true,

  tabstop       = 2,
  shiftwidth    = 2,
  softtabstop   = 2,
  expandtab     = true,
  smarttab      = true,
  -- backspace     = 2,
}

for k, v in pairs(options) do
  vim.o[k] = v
end
