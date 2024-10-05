vim.g.python3_host_prog = os.getenv("HOME") .. "/opt/micromamba/envs/pynvim-py311/bin/python"

local opt = vim.opt
local cmd = vim.cmd

opt.guicursor = ""

opt.nu = true
opt.cursorline = true
opt.relativenumber = false

-- tab
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
cmd [[autocmd Filetype cpp setlocal expandtab tabstop=2 shiftwidth=2]]
cmd [[autocmd Filetype tex setlocal expandtab tabstop=2 shiftwidth=2]]
cmd [[autocmd Filetype json setlocal expandtab tabstop=2 shiftwidth=2]]

opt.swapfile = false
opt.backup = false
opt.writebackup = false -- suggested by coc
opt.updatetime = 300 -- suggested by coc
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

opt.smartindent = true
opt.wrap = false
opt.hlsearch = true
opt.incsearch = true
opt.colorcolumn = "80"
opt.signcolumn = "yes" -- suggested by coc
opt.isfname:append("@-@")
opt.scrolloff = 8
opt.foldenable = false

opt.termguicolors = true

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})
