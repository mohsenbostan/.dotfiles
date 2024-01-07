local trouble_setup, trouble = pcall(require, "trouble")
if not trouble_setup then
	return
end

vim.keymap.set("n", "<leader>tt", function()
	trouble.toggle()
end)

vim.keymap.set("n", "<leader>tn", function()
	trouble.next({ skip_groups = true, jump = true })
end)

vim.keymap.set("n", "<leader>tp", function()
	trouble.previous({ skip_groups = true, jump = true })
end)
