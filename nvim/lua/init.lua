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
    termguicolors = true,
    -- 3 means toggle global statusline
    laststatus = 3,
    pumheight = 10,
    -- last status
    -- ls = 0,
    -- command height
    ch = 0
}

for k, v in pairs(options) do
  vim.o[k] = v
end

vim.opt.fillchars:append({
    horiz = '━',
    horizup = '┻',
    horizdown = '┳',
    vert = '┃',
    vertleft = '┨',
    vertright = '┣',
    verthoriz = '╋',
})

vim.g.symbols_outline = {
    auto_preview = false,
    position = 'left',
}

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable", -- latest stable release
      lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("lazy_plugins", {
    ui = {
        icons = {
            cmd = "⌘", config = "🛠", event = "📅",
            ft = "📂", init = "⚙", keys = "🗝",
            plugin = "🔌", runtime = "💻", source = "📄",
            start = "🚀", task = "📌", lazy = "💤 ",
        },
    },
})

-- require('plugins/packer')
-- vim.schedule(function()
--   require('haishan').setup()
-- end)

-- vim.api.nvim_create_autocmd('ColorScheme', {
--   pattern = 'onedark',
--   desc = 'extend / override onedark',
--   callback = function()
--     local h = function(...) vim.api.nvim_set_hl(0, ...) end

--     h('String', {fg = '#FFEB95'})
--     h('TelescopeMatching', {link = 'Boolean'})
--   end
-- })

-- require("nvim-lspconfig/lua")
-- require("lspkind/lua")

-- requires norcalli/nvim-colorizer.lua
-- need disable the color highlight of coc-highlight
--   coc.preferences.colorSupport: false
-- require'colorizer'.setup()
-- require('indent_guides').setup()
