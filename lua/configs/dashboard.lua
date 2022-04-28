local M = {}

function M.config()
  local g = vim.g
  local fn = vim.fn

  local plugins_count = fn.len(vim.fn.globpath(fn.stdpath "data" .. "/site/pack/packer/start", "*", 0, 1))

  g.dashboard_default_executive = "telescope"
  g.dashboard_custom_header = {
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    "    ███    ██ ██    ██ ██ ███    ███",
    "    ████   ██ ██    ██ ██ ████  ████",
    "    ██ ██  ██ ██    ██ ██ ██ ████ ██",
    "    ██  ██ ██  ██  ██  ██ ██  ██  ██",
    "    ██   ████   ████   ██ ██      ██",
    " ",
  }

  g.dashboard_custom_footer = {
    " Nvim loaded " .. plugins_count .. " plugins ",
  }
end

return M
