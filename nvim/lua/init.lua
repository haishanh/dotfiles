-- vim.o.hidden = true

-- if has('persistent_undo')
--   set nobackup
--   set nowritebackup
--   set undodir=$HOME/.vim/undo-dir
--   set backupdir=$HOME/.vim/backup
--   set undofile
-- endif
vim.o.swapfile = false
vim.o.undofile = true
vim.o.undodir = vim.fn.expand('~/.vim/undo-dir')
-- case insensitive search
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.infercase = true
-- search
vim.o.hlsearch = true  -- highlight matches
vim.o.incsearch = true -- search as characters are entered
vim.o.inccommand = "split"

-- show invisibles
-- set list listchars=tab:»·,trail:·,nbsp:·
vim.opt.listchars = { tab = "  ", trail = "·", extends = "»", precedes = "«", nbsp = "░" }
vim.opt.list = true

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

require("opts")
require("autocmd")
require("keymaps")

-- "data" usually is "~/.local/share/nvim"
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
      cmd = "⌘",
      config = "🛠",
      event = "📅",
      ft = "📂",
      init = "⚙",
      keys = "🗝",
      plugin = "🔌",
      runtime = "💻",
      source = "📄",
      start = "🚀",
      task = "📌",
      lazy = "💤 ",
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
