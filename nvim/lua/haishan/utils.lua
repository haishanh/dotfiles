local utils = {}

local api = vim.api
local job = require("plenary.job")

function utils.assign(t0, t1)
  for k,v in pairs(t1) do t0[k] = v end
end

-- steal from telescope
function utils.buf_delete(bufnr)
  if bufnr == nil then
    return
  end

  -- Suppress the buffer deleted message for those with &report<2
  local start_report = vim.o.report
  if start_report < 2 then
    vim.o.report = 2
  end

  if vim.api.nvim_buf_is_valid(bufnr) and vim.api.nvim_buf_is_loaded(bufnr) then
    vim.api.nvim_buf_delete(bufnr, { force = true })
  end

  if start_report < 2 then
    vim.o.report = start_report
  end
end

-- steal from telescope
function utils.win_delete(name, win_id, force, bdelete)
  if win_id == nil or not vim.api.nvim_win_is_valid(win_id) then
    return
  end

  local bufnr = vim.api.nvim_win_get_buf(win_id)
  if bdelete then
    utils.buf_delete(bufnr)
  end

  if not vim.api.nvim_win_is_valid(win_id) then
    return
  end

  if not pcall(vim.api.nvim_win_close, win_id, force) then
    -- log.trace("Unable to close window: ", name, "/", win_id)
  end
end

function utils.open_in_browser(url)
  local command = vim.loop.os_uname().sysname == "Darwin" and "open" or "xdg-open"
  job:new({ command = command, args = { url } }):start()
end

function utils.run_cli_cmd(command, args, cwd)
  local output
  local p = job:new({
    command = command,
    args = args,
    -- cwd = cwd or M.get_git_root(),
  })
  p:after_success(function(j)
    output = j:result()
  end)
  p:sync()
  return output or {}
end

return utils
