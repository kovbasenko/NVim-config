local M = {}

function M.config()
  local status_ok, toggleterm = pcall(require, "toggleterm")
  if status_ok then
    toggleterm.setup(require("core.utils").user_plugin_opts("plugins.toggleterm", {
      size = 10,
      open_mapping = [[<c-\>]],
      hide_numbers = true,
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      insert_mappings = true,
      persist_size = true,
      direction = "float",
      close_on_exit = true,
      shell = "/bin/bash -l",
      float_opts = {
        border = "curved",
        winblend = 0,
        width = 150,
        height = 40,
        highlights = {
          border = "Normal",
          background = "Normal",
        },
      },
    }))
  end
end

return M
