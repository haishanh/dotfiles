local highlight = {
  "Ibl0",
  "Ibl1",
  "Ibl2",
  "Ibl3",
  "Ibl4",
  "Ibl5",
  "Ibl6",
}

return {
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    local hooks = require "ibl.hooks"
    local h0 = { fg = "#515151" }
    local h1 = { fg = "#333333" }

    -- create the highlight groups in the highlight setup hook, so they are reset
    -- every time the colorscheme changes
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      vim.api.nvim_set_hl(0, "Ibl0", h0)
      vim.api.nvim_set_hl(0, "Ibl1", h1)
      vim.api.nvim_set_hl(0, "Ibl2", h0)
      vim.api.nvim_set_hl(0, "Ibl3", h1)
      vim.api.nvim_set_hl(0, "Ibl4", h0)
      vim.api.nvim_set_hl(0, "Ibl5", h1)
      vim.api.nvim_set_hl(0, "Ibl6", h0)
    end)
    require('ibl').setup({
      indent = {
        highlight = highlight,
        -- char = "┊",
        char = "│",
      },
      scope = {
        enabled = false,
      },
      exclude = {
        filetypes = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason" }
      },
    })
  end,
}
