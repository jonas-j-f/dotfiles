require("telescope").load_extension("file_browser")
vim.keymap.set("n", "<leader>b", require("telescope").extensions.file_browser.file_browser)
