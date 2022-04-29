local config = {
  plugins = {
    packer = {
      compile_path = vim.fn.stdpath "config" .. "/lua/packer_compiled.lua",
    },
  },

  diagnostics = {
    virtual_text = true,
  },

  enabled = {
    bufferline = true,
    neo_tree = true,
    lualine = true,
    gitsigns = true,
    colorizer = true,
    toggle_term = true,
    comment = true,
    symbols_outline = true,
    indent_blankline = true,
    dashboard = true,
    neoscroll = true,
    ts_rainbow = true,
    ts_autotag = true,
  },

  cmp = {
    source_priority = {
      luasnip = 1000,
      nvim_lsp = 750,
      buffer = 500,
      path = 250,
    },
  },

  ui = {
    nui_input = true,
    telescope_select = true,
  },
}

return config
