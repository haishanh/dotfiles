-- I'm a lua noop
-- https://replit.com/languages/lua
-- https://learnxinyminutes.com/docs/lua/

local M = {}
local utils = require('haishan.utils')
local icons = require "nvim-nonicons"
local actions = {}

local preview = {}
local prompt = {}

local a0 = vim.api
local api = vim.api

local prompt_prefix = '  '

local action_tbl = {
  q = { label = icons.get('x-circle') .. ' close', fn = 'close', },
  x = { label = icons.get('svelte') .. ' close', fn = 'close', },
  -- a = { label = 'hello', fn = 'hello', },
  c = { label = icons.get('mark-github') .. ' github link', fn = 'github_link', },
  p = { label = icons.get('browser') .. ' project mgmt', fn = 'project_mgmt', },
}

function set_mappings(buf)
  local mappings = {
    ['<cr>'] = 'select()',
    -- h = 'update_view(-1)',
    -- l = 'update_view(1)',
    -- q = 'close_window()',
    -- k = 'move_cursor()'
  }

  for k,v in pairs(mappings) do
    api.nvim_buf_set_keymap(buf, 'i', k, '<esc>:lua require"haishan".'..v..'<cr>', { nowait = true, noremap = true, silent = true })
    -- api.nvim_buf_set_keymap(buf, 'i', k, '<esc>:lua require"haishan".'..v..'<cr>', { nowait = true, noremap = true, silent = true })
  end
end

function M.select()
  local k = api.nvim_buf_get_lines(prompt.buf, 0, 1, false)[1]:sub(#prompt_prefix + 1)
  local v = action_tbl[k]
  pcall(actions[v.fn])
  -- actions[]
  -- print(vim.inspect(action_tbl[k]))
  -- close_wins()
end


function close_wins()
  utils.win_delete("preview_win", preview.win, true, true)
  utils.win_delete("prompt_win", prompt.win, true, true)

  -- api.nvim_win_close(preview.win, true)
end


function actions.github_link()
  close_wins()
  local linenr = vim.api.nvim_win_get_cursor(0)[1]
  local full_path = vim.api.nvim_buf_get_name(0) -- 0 means the current buffer
  local result = utils.run_cli_cmd('git', {'rev-parse', '--show-toplevel'})[1]
  local file_path = string.sub(full_path, #result + 1);

  local branch = utils.run_cli_cmd('git', {'branch', '--show-current'})[1]
  -- assume the name of the remote is origin
  local repo_url = utils.run_cli_cmd('git', {'remote', 'get-url', 'origin'})[1]

  local org, repo = string.match(repo_url, "^git@github.com:([^/]+)/([^/]+).git")

  if not org then
    org, repo = string.match(repo_url, "^https://.*github.com/([^/]+)/([^/]+).git")
  end

  if not org then
    print('error github repo url not found or match')
  end

  -- file_path has a leading '/'
  url = string.format('https://github.com/%s/%s/blob/%s%s#L%s', org, repo, branch, file_path, linenr);

  print(url)
  utils.open_in_browser(url)
end

-- local telescope_project_extension_loaded = false
function actions.project_mgmt()
  -- if not telescope_project_extension_loaded then
  --   telescope_project_extension_loaded = true
  --   require'telescope'.load_extension('project')
  -- end

  require'telescope'.extensions.project.project{}
end

function actions.hello()
  print('hello')
  close_wins()
end

function actions.close()
  print('close')
  close_wins()
end

function M.setup()
  a0.nvim_create_user_command("Haishan", function(opts)
    -- print(opts.fargs)
    -- print(opts.fargs[0])
    -- print(opts.fargs[1])
    -- for k, v in ipairs(opts.fargs) do print(k, v) end

    local plenary = require('plenary');
    local popup = plenary.popup;

    -- local buf = vim.api.nvim_create_buf(false, true);

    local col = math.floor((vim.o.columns - 70) / 2)

    local preview_line = math.floor((vim.o.lines - 15 ) / 2)
    local prompt_line = math.floor((vim.o.lines + 15 ) / 2 + 2)

    -- sort keys in action_tbl
    local action_tbl_keys = {}
    for k in pairs(action_tbl) do
      table.insert(action_tbl_keys, k)
    end
    table.sort(action_tbl_keys)
    local preview_cnt = {}
    for idx, key_name in ipairs(action_tbl_keys) do
      local v = action_tbl[key_name]
      -- print(k, vim.inspect(v))
      local s = string.format("%s\t%s", key_name, v.label)
      table.insert(preview_cnt, s)
    end
    -- print(vim.inspect(preview_cnt))

    preview.buf, preview.win = win0(popup, { title = '', minheight = 15, line = preview_line, col = col, })
    api.nvim_buf_set_lines(preview.buf, 0, -1, false, preview_cnt)
    api.nvim_buf_set_option(preview.buf, 'modifiable', false)

    -- line = math.floor((vim.o.lines - 15 ) / 2)
    prompt.buf, prompt.win = win0(popup, { height = 1, line = prompt_line, col = col, })
    api.nvim_buf_set_option(prompt.buf, "buftype", "prompt")
    vim.fn.prompt_setprompt(prompt.buf, prompt_prefix)
    -- api.nvim_buf_set_lines(prompt.buf, 0, 1, false, {""})

    set_mappings(prompt.buf)
    vim.cmd('startinsert')


    -- local keys = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)
    -- vim.api.nvim_feedkeys(keys, "i", true)

    -- win1(popup)

  -- function Picker:_get_prompt()
  --   return vim.api.nvim_buf_get_lines(self.prompt_bufnr, 0, 1, false)[1]:sub(#self.prompt_prefix + 1)
  -- end

    -- a0.nvim_buf_set_lines(bufnr, 0, 2, false, utils.repeated_table(self.max_results, ""))

    -- require("telescope.command").load_command(unpack(opts.fargs))
  end, {
    nargs= '*',
    complete = function(ArgLead, CmdLine, CursorPos)
          return { 'strawberry', 'star', 'stellar' }
      end,
  })
end

function win0(popup, popup_opts_user)
  popup_opts_overrides = popup_opts_user or {}

  local popup_opts = {
    border = true,
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    highlight = 'Normal',
    borderhighlight = 'Normal',
    titlehighlight = 'Normal',
    minwidth = 70,
    -- title = 'hello',
    -- width = 30,
    -- height = 20,
  }

  utils.assign(popup_opts, popup_opts_overrides);
  local win, win_opts = popup.create('', popup_opts)
  local bufnr = a0.nvim_win_get_buf(win)
  -- popup.move(win, { line = line, col = col })
  return bufnr, win
end

return M
