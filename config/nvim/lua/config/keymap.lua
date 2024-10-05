local set = vim.keymap.set

-------------------------------------------------------------------------------
-- https://vimhelp.org/map.txt.html#<Leader>
vim.g.mapleader = ' '

-- To map <Esc> to exit terminal-mode:
-- https://neovim.io/doc/user/nvim_terminal_emulator.html
set('t', '<Esc>', '<C-\\><C-n>')

-- replace selected text
-- https://stackoverflow.com/a/676619
set('v', '<C-r>', '"hy:%s/<C-r>h//gc<left><left><left>')

-------------------------------------------------------------------------------
-- undotree
set('n', '<leader>u', vim.cmd.UndotreeToggle)
