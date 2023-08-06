-- Resize on Shift
vim.keymap.set("n", "<S-Up>", "<cmd>resize +2<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<S-Down>", "<cmd>resize -2<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<S-Left>", "<cmd>vertical resize +2<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<S-Right>", "<cmd>vertical resize -2<CR>", { noremap = true, silent = true })

-- Clear search with <esc>
vim.keymap.set(
	{ "i", "n" },
	"<esc>",
	"<cmd>noh<cr><esc>",
	{ noremap = true, silent = true, desc = "Escape and clear hlsearch" }
)
