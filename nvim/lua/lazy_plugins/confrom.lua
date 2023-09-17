return {
  {
    'stevearc/conform.nvim',
    event = 'VeryLazy',
    opts = {
      formatters_by_ft = {
        javascript = { { "prettier" } },
        json = { { "prettier" } },
        yaml = { { "prettier" } },
      },
    },
  }
}
