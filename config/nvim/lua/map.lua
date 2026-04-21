local M = {}

function M.nmap(shortcut, command)
    -- normal mode remampings
    M.map('n', shortcut, command)
end

function M.imap(shortcut, command)
    -- insert mode remampings
    M.map('i', shortcut, command)
end

function M.map(mode, shortcut, command)
    -- default options
    options = { noremap = true,
                silent = true}
    vim.api.nvim_set_keymap(mode, shortcut, command, options) 
end

return M
