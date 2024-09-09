return {
  {
    'stevearc/conform.nvim',
    event = 'VeryLazy',
    opts = {
      formatters_by_ft = {
        typescriptreact = { { "prettier" } },
        typescript = { { "prettier" } },
        javascript = { { "prettier" } },
        json = { { "prettier" } },
        yaml = { { "prettier" } },
        scss = { { "prettier" } },
        css = { { "prettier" } },
        markdown = { { "prettier" } },
      },
    },
  }
}
