return {
  {
    "ibhagwan/fzf-lua",
    lazy = true,
    opts = function()
      return {
        winopts = {
          height = 0.6, width = 0.9,
          border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
        },
        fzf_opts = {
          ['--layout'] = 'default',
        },
      }
    end
  }
}
