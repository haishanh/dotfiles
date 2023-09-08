-- Resize on Shift
vim.keymap.set("n", "<S-Up>", "<cmd>resize +2<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<S-Down>", "<cmd>resize -2<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<S-Left>", "<cmd>vertical resize +2<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<S-Right>", "<cmd>vertical resize -2<CR>", { noremap = true, silent = true })

-- Clear search with <esc>
vim.keymap.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", {
  noremap = true, silent = true, desc = "Escape and clear hlsearch"
})

-- fzf
vim.keymap.set({ "n" }, "<c-p>", "<cmd>lua require('fzf-lua').files()<CR>", {
  noremap = true, silent = true, desc = "fzf files()"
})
vim.keymap.set({ "n" }, "<c-l>", "<cmd>lua require('fzf-lua').buffers()<CR>", {
  noremap = true, silent = true, desc = "fzf buffers()"
})
vim.keymap.set({ "n" }, "<leader>ga", "<cmd>lua require('fzf-lua').grep_cword()<CR>", {
  noremap = true, silent = true, desc = "fzf grep_cword()"
})
vim.keymap.set({ "n" }, "<leader>gb", "<cmd>lua require('fzf-lua').grep()<CR>", {
  noremap = true, silent = true, desc = "fzf grep()"
})
