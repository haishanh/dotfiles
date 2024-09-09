return {
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    event = "VeryLazy",
    dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope-project.nvim' },
    keys = {
      {"<c-.>", ":Telescope<CR>"}
    },
    -- config = function ()
    --   local project_actions = require("telescope._extensions.project.actions")
    --   require'telescope'.load_extension('project')
    --   require('telescope').setup {
    --     extensions = {
    --       project = {
    --         base_dirs = {
    --           '~/dev/src',
    --           {'~/dev/src2'},
    --           {'~/dev/src3', max_depth = 4},
    --           {path = '~/dev/src4'},
    --           {path = '~/dev/src5', max_depth = 2},
    --         },
    --         hidden_files = true, -- default: false
    --         theme = "dropdown",
    --         order_by = "asc",
    --         search_by = "title",
    --         sync_with_nvim_tree = true, -- default false
    --         -- default for on_project_selected = find project files
    --         on_project_selected = function(prompt_bufnr)
    --           -- Do anything you want in here. For example:
    --           project_actions.change_working_directory(prompt_bufnr, false)
    --           require("harpoon.ui").nav_file(1)
    --         end
    --       }
    --     }
    --   }
    -- end
  }
}
