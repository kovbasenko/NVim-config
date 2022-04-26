require("nvim-treesitter.configs").setup({
	ensure_installed = "all",
	ignore_install = { "css" },
	highlight = {
		enable = true,
	},
})
