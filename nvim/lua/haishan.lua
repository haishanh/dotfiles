local a0 = vim.api

-- https://replit.com/languages/lua
a0.nvim_create_user_command("Haishan", function(opts)
  -- print(opts.fargs)
  -- print(opts.fargs[0])
  -- print(opts.fargs[1])
  -- print(opts.fargs[2])
  for k, v in ipairs(opts.fargs) do
    print(k, v)
  end

  local plenary = require('plenary');
  local popup = plenary.popup;

  -- local buf = vim.api.nvim_create_buf(false, true);
  win0(popup)
  win1(popup)

-- function Picker:_get_prompt()
--   return vim.api.nvim_buf_get_lines(self.prompt_bufnr, 0, 1, false)[1]:sub(#self.prompt_prefix + 1)
-- end

  -- a0.nvim_buf_set_lines(bufnr, 0, 2, false, utils.repeated_table(self.max_results, ""))

  -- require("telescope.command").load_command(unpack(opts.fargs))
end, {
  nargs= '*',
    complete = function(ArgLead, CmdLine, CursorPos)
        return {
            'strawberry',
            'star',
            'stellar',
        }
    end,
})

function win0(popup)
  local win, win_opts = popup.create('', {
    -- border = 'rounded',
    border = true,
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    highlight = 'Normal',
    borderhighlight = 'Normal',
    titlehighlight = 'Normal',
    -- title = 'hello',
    -- width = 30,
    minwidth = 70,
    minheight = 15,
    -- height = 20,
  })

  local bufnr = a0.nvim_win_get_buf(win)

  local line = math.floor((vim.o.lines - 15 ) / 2)
  local col = math.floor((vim.o.columns - 70) / 2)
  popup.move(win, { line = line, col = col })
  a0.nvim_buf_set_lines(bufnr, 0, 1, false, {"abc", "two", "three"})
end

function win1(popup)
  local win, win_opts = popup.create('', {
    -- border = 'rounded',
    border = true,
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    highlight = 'Normal',
    borderhighlight = 'Normal',
    titlehighlight = 'Normal',
    -- title = 'hello',
    -- width = 30,
    minwidth = 70,
    -- minheight = 3,
    height = 1,
  })

  local bufnr = a0.nvim_win_get_buf(win)

  local line = math.floor((vim.o.lines + 15 ) / 2 + 2)
  local col = math.floor((vim.o.columns - 70) / 2)
  popup.move(win, { line = line, col = col })
  a0.nvim_buf_set_lines(bufnr, 0, 1, false, {"abc"})
end
