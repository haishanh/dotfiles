return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "mrjones2014/nvim-ts-rainbow"
    },
    version = false, -- last release is way too old
    event = { "BufReadPost", "BufNewFile" },
    keys = {
      { "<c-space>", desc = "Increment selection" },
      { "<bs>", desc = "Schrink selection", mode = "x" },
    },
    opts = {
      -- supported langs https://github.com/nvim-treesitter/nvim-treesitter#supported-languages
      ensure_installed = {
        "typescript","javascript","html","css","scss","svelte", "dockerfile", "bash","markdown","toml","zig","yaml"
      },
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = {enable = true},
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "gnn",
          node_incremental = "grn",
          scope_incremental = "grc",
          node_decremental = "grm",
        },
      },
      -- https://github.com/mrjones2014/nvim-ts-rainbow
      rainbow = {enable = true},
      -- https://github.com/nvim-treesitter/playground
      playground = {enable = true},
      context_commentstring = {
        enable = true,
        enable_autocmd = false,
        config = {
          zig = {
            __default = '// %s',
          }
        }
      },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  }
}
