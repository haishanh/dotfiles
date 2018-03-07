local icons = require "nvim-nonicons"

require('lspkind').init({
    with_text = true,
    symbol_map = {
      Text = icons.get("text"),
      Method = '',
      Function = '',
      Constructor = '',
      Variable = icons.get("variable"),
      Class = '',
      Interface = icons.get("interface"),
      Module = icons.get("module"),
      Property = '',
      Unit = '',
      Value = '',
      Enum = icons.get("enum"),
      Keyword = icons.get("keyword"),
      Snippet = icons.get("snippet"),
      Color = icons.get("color"),
      File = icons.get("file"),
      Folder = icons.get("folder"),
      EnumMember = icons.get("enum member"),
      Constant = icons.get("constant"),
      Struct = icons.get("struct")
    },
})
