vim.opt.rtp:append(vim.fn.stdpath "config" .. "/../astronvim")

local impatient_ok, impatient = pcall(require, "impatient")
if impatient_ok then
  impatient.enable_profile()
end

local utils = require "core.utils"

utils.disabled_builtins()

local sources = {
  "core.options",
  "core.plugins",
  "core.autocmds",
  "core.mappings",
}

for _, source in ipairs(sources) do
  local status_ok, fault = pcall(require, source)
  if not status_ok then
    error("Failed to load " .. source .. "\n\n" .. fault)
  elseif source == "core.plugins" then
    utils.compiled()
  end
end
