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
    indent_blankline = true,
    dashboard = true,
    neoscroll = true,
    ts_rainbow = true,
    ts_autotag = true,
  },

  ui = {
    nui_input = true,
    telescope_select = true,
  },
}

return config
