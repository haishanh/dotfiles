-- vim.api.nvim_create_user_command({
--     command = "MyCommand",
--     nargs = 1, -- Number of arguments the command expects
--     complete = "customlist", -- Optional, specify custom completion
--     range = "", -- Optional, specify a range for the command (e.g., '<line1>,<line2>')
--     bang = false, -- Optional, whether the command can take a '!' (e.g., :MyCommand!)
--     bar = false, -- Optional, whether the command can be followed by a '|' (e.g., :MyCommand | othercommand)
--     count = 0, -- Optional, whether the command can take a count (e.g., :2MyCommand)
--     definition = function(args)
--         -- The code to execute when the command is invoked
--         -- 'args' is a table containing the arguments passed to the command
--         -- You can access arguments using args[1], args[2], etc.
--         -- For example, if you expect one argument, you can access it as args[1]
--         -- Your code here
--     end,
--     description = "Description of your custom command", -- Optional, a description for the command
-- })

vim.api.nvim_create_user_command("Format", function(args)
  local range = nil
  if args.count ~= -1 then
    local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
    range = {
      start = { args.line1, 0 },
      ["end"] = { args.line2, end_line:len() },
    }
  end
  require("conform").format({ async = true, lsp_fallback = true, range = range })
end, { range = true })

vim.api.nvim_create_user_command("Fix", function()
  vim.cmd("EslintFixAll")
end, { desc = "EslintFixAll" })
