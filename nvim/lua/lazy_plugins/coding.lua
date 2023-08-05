return {
  -- surround
  {
    "echasnovski/mini.surround",
    keys = function(_, keys)
      -- Populate the keys based on the user's options
      local plugin = require("lazy.core.config").spec.plugins["mini.surround"]
      local opts = require("lazy.core.plugin").values(plugin, "opts", false)
      local mappings = {
        { opts.mappings.add,            desc = "Add surrounding",                     mode = { "n", "v" } },
        { opts.mappings.delete,         desc = "Delete surrounding" },
        { opts.mappings.find,           desc = "Find right surrounding" },
        { opts.mappings.find_left,      desc = "Find left surrounding" },
        { opts.mappings.highlight,      desc = "Highlight surrounding" },
        { opts.mappings.replace,        desc = "Replace surrounding" },
        { opts.mappings.update_n_lines, desc = "Update `MiniSurround.config.n_lines`" },
      }
      return vim.list_extend(mappings, keys)
    end,
    opts = {
      mappings = {
        add = "gza",            -- Add surrounding in Normal and Visual modes
        delete = "gzd",         -- Delete surrounding
        find = "gzf",           -- Find surrounding (to the right)
        find_left = "gzF",      -- Find surrounding (to the left)
        highlight = "gzh",      -- Highlight surrounding
        replace = "gzr",        -- Replace surrounding
        update_n_lines = "gzn", -- Update `n_lines`
      },
    },
    config = function(_, opts)
      -- use gz mappings instead of s to prevent conflict with leap
      require("mini.surround").setup(opts)
    end,
  },

  -- comments
  { "JoosepAlviste/nvim-ts-context-commentstring", lazy = true },
  {
    "echasnovski/mini.comment",
    event = "VeryLazy",
    opts = {
      hooks = {
        pre = function()
          require("ts_context_commentstring.internal").update_commentstring({})
        end,
      },
    },
    config = function(_, opts)
      require("mini.comment").setup(opts)
    end,
  },

  -- better text-objects
  {
    "echasnovski/mini.ai",
    -- keys = {
    --   { "a", mode = { "x", "o" } },
    --   { "i", mode = { "x", "o" } },
    -- },
    event = "VeryLazy",
    -- dependencies = {
    --   {
    --     "nvim-treesitter/nvim-treesitter-textobjects",
    --     init = function()
    --       -- no need to load the plugin, since we only need its queries
    --       require("lazy.core.loader").disable_rtp_plugin("nvim-treesitter-textobjects")
    --     end,
    --   },
    -- },
    opts = function()
      -- local ai = require("mini.ai")
      local spec_treesitter = require('mini.ai').gen_spec.treesitter
      return {
        -- n_lines = 500,
        -- custom_textobjects = {
        --   o = ai.gen_spec.treesitter({
        --     a = { "@block.outer", "@conditional.outer", "@loop.outer" },
        --     i = { "@block.inner", "@conditional.inner", "@loop.inner" },
        --   }, {}),
        --   f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }, {}),
        --   c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }, {}),
        -- },
        custom_textobjects = {
          F = spec_treesitter({ a = '@function.outer', i = '@function.inner' }),
          o = spec_treesitter({
            a = { '@conditional.outer', '@loop.outer' },
            i = { '@conditional.inner', '@loop.inner' },
          })
        }
      }
    end,
    -- config = function(_, opts)
    --   require("mini.ai").setup(opts)
    --   -- register all text objects with which-key
    --   if require("util").has("which-key.nvim") then
    --     ---@type table<string, string|table>
    --     local i = {
    --       [" "] = "Whitespace",
    --       ['"'] = 'Balanced "',
    --       ["'"] = "Balanced '",
    --       ["`"] = "Balanced `",
    --       ["("] = "Balanced (",
    --       [")"] = "Balanced ) including white-space",
    --       [">"] = "Balanced > including white-space",
    --       ["<lt>"] = "Balanced <",
    --       ["]"] = "Balanced ] including white-space",
    --       ["["] = "Balanced [",
    --       ["}"] = "Balanced } including white-space",
    --       ["{"] = "Balanced {",
    --       ["?"] = "User Prompt",
    --       _ = "Underscore",
    --       a = "Argument",
    --       b = "Balanced ), ], }",
    --       c = "Class",
    --       f = "Function",
    --       o = "Block, conditional, loop",
    --       q = "Quote `, \", '",
    --       t = "Tag",
    --     }
    --     local a = vim.deepcopy(i)
    --     for k, v in pairs(a) do
    --       a[k] = v:gsub(" including.*", "")
    --     end
    --
    --     local ic = vim.deepcopy(i)
    --     local ac = vim.deepcopy(a)
    --     for key, name in pairs({ n = "Next", l = "Last" }) do
    --       i[key] = vim.tbl_extend("force", { name = "Inside " .. name .. " textobject" }, ic)
    --       a[key] = vim.tbl_extend("force", { name = "Around " .. name .. " textobject" }, ac)
    --     end
    --     require("which-key").register({
    --       mode = { "o", "x" },
    --       i = i,
    --       a = a,
    --     })
    --   end
    -- end,
  },
}
