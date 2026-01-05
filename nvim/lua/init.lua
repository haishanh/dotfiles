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

-- nvim-nonicons x nvim-web-devicons
vim.g.override_nvim_web_devicons = false

require("opts")
require("autocmd")
require("keymaps")
require("cmd")

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
    performance = {
        rtp = {
            disabled_plugins = {
                "gzip",
                "tar",
                "tarPlugin",
                "zip",
                "zipPlugin",
                "getscript",
                "getscriptPlugin",
                "vimball",
                "vimballPlugin",
                "matchit",
                "matchparen",
                "2html_plugin",
                "logiPat",
                "rrhelper",
                "netrw",
                "netrwPlugin",
                "netrwSettings",
                "netrwFileHandlers",
                "tutor",
            }
        }
    }
})
