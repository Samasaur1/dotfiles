vim.opt.spell=true
-- vim.opt.shiftwidth = 2

local opts = { noremap = true, silent = true }
vim.api.nvim_buf_set_keymap(0, 'x', '<leader>mf', ":!markdown format --emphasis-marker _ --strong-emphasis-marker \\*<CR>", opts)
-- vim.api.nvim_buf_set_keymap(0, 'x', '<leader>ht', ':%s/\[\(.*\)\](\(.*\))\$ \(.*\)$/<code><span class="user-select-none">[\1](\2)$ <\/span><span class="user-select-all">\3<\/span><\/code>', opts)
