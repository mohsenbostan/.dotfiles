-- import nvim-treesitter plugin safely
local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

local status, treesitter_context = pcall(require, "treesitter-context")
if not status then
	return
end

-- configure treesitter
treesitter.setup({
	-- enable syntax highlighting
	highlight = {
		enable = true,
	},
	-- enable indentation
	indent = { enable = true },
	-- enable autotagging (w/ nvim-ts-autotag plugin)
	autotag = { enable = true },
	-- ensure these language parsers are installed
	ensure_installed = {
		"json",
		"javascript",
		"typescript",
		"rust",
		"tsx",
		"yaml",
		"html",
		"markdown",
		"markdown_inline",
		"bash",
		"lua",
		"vim",
		"dockerfile",
		"gitignore",
		"go",
	},
	-- auto install above language parsers
	auto_install = true,
})

treesitter_context.setup({
	enable = true,
})

vim.keymap.set("n", "[c", function()
	require("treesitter-context").go_to_context()
end, { silent = true })
