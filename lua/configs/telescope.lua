local M = {}

function M.config()
  local status_ok, telescope = pcall(require, "telescope")
  if status_ok then
    local actions = require "telescope.actions"

    local notify_present, _ = pcall(require, "notify")
    if notify_present then
      telescope.load_extension "notify"
    end

    telescope.setup(require("core.utils").user_plugin_opts("plugins.telescope", {
      defaults = {
        prompt_prefix = " ",
        selection_caret = "❯ ",
        mappings = {
          i = {
            ["<C-n>"] = actions.cycle_history_next,
            ["<C-p>"] = actions.cycle_history_prev,

            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,

            ["<CR>"] = actions.select_default,
            ["<C-x>"] = actions.select_horizontal,
            ["<C-v>"] = actions.select_vertical,

            ["<C-u>"] = actions.preview_scrolling_up,
            ["<C-d>"] = actions.preview_scrolling_down,
          },

          n = {
            ["<esc>"] = actions.close,
            ["<CR>"] = actions.select_default,
            ["<C-x>"] = actions.select_horizontal,
            ["<C-v>"] = actions.select_vertical,

            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,

            ["<C-u>"] = actions.preview_scrolling_up,
            ["<C-d>"] = actions.preview_scrolling_down,
          },
        },
      },
    }))
  end
end

return M
