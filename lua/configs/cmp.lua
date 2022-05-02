local M = {}

function M.config()
  local cmp_status_ok, cmp = pcall(require, "cmp")
  local snip_status_ok, luasnip = pcall(require, "luasnip")
  local lspkind = require "lspkind"
  local mapping = {
    ["<Up>"] = {
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    },
    ["<Down>"] = {
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    },
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ["<C-k>"] = cmp.mapping.select_prev_item(),
    ["<C-j>"] = cmp.mapping.select_next_item(),
    ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
    ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    ["<C-y>"] = cmp.config.disable,
    ["<C-e>"] = cmp.mapping {
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    },
    ["<CR>"] = cmp.mapping(cmp.mapping.confirm { select = true }, { "i", "c", "s" }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expandable() then
        luasnip.expand()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, {
      "i",
      "s",
      "c",
    }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, {
      "i",
      "s",
      "c",
    }),
  }

  if cmp_status_ok and snip_status_ok then
    cmp.setup(require("core.utils").user_plugin_opts("plugins.cmp", {
      preselect = cmp.PreselectMode.None,
      formatting = {
        fields = { "abbr", "kind", "menu" },
        format = lspkind.cmp_format {
          menu = {
            nvim_lsp_signature_help = " [Args]",
            nvim_lsp = " [Lsp]",
            luasnip = " [Snip]",
            buffer = " [Buff]",
          },
        },
      },
      completion = {
        completeopt = "menu,menuone,noinsert",
      },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      duplicates = {
        nvim_lsp = 1,
        luasnip = 1,
        cmp_tabnine = 1,
        buffer = 1,
        path = 1,
      },
      confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      experimental = {
        ghost_text = true,
        native_menu = false,
      },
      sources = {
        { name = "nvim_lsp_signature_help", priority = 1250 },
        { name = "nvim_lsp", priority = 1000 },
        { name = "luasnip", priority = 750 },
        { name = "buffer", priority = 500 },
        { name = "path", priority = 250 },
      },
      mapping = mapping,
    }))
  end

  cmp.setup.cmdline(":", {
    completion = { completeopt = "menu,menuone,noinsert" },
    mapping = mapping,
    sources = {
      { name = "cmdline" },
    },
  })

  -- cmp.setup.cmdline("/", {
  --   completion = { completeopt = "menu,menuone,noinsert" },
  --   mapping = mapping,
  --   sources = {
  --     { name = "buffer" },
  --   },
  -- })
end

return M
