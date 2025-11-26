-- augroup SetTabstopByFileType
--   autocmd!
--   autocmd FileType python setlocal tabstop=4 shiftwidth=4 expandtab
--   autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 expandtab
--   autocmd FileType go setlocal tabstop=4 shiftwidth=4 noexpandtab
-- augroup END
--
--
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank()
    end,
})


local function set_theme()
    if vim.o.background == 'dark' then
        vim.cmd.colorscheme('tokyonight')
    else
        vim.cmd.colorscheme('everforest')
    end
end

vim.api.nvim_create_autocmd("OptionSet", {
    pattern = "background",
    callback = function()
        set_theme()
    end,
})
set_theme()
