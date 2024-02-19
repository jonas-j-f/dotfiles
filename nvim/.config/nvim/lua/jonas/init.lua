require("jonas.remap")
require("jonas.set")
require("jonas.packer")
require("jonas.snips")

local generalSettingsGroup = vim.api.nvim_create_augroup('General settings', { clear = true })

vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'tex' },
    callback = function()
        print("Execute autocmd")
        vim.o.colorcolumn  = '70'
        vim.o.textwidth = 70
        vim.o.shiftwidth = 2
        vim.o.tabstop = 2
        vim.o.softtabstop = 2
    end,
    group = generalSettingsGroup,
})
