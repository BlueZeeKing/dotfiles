-- vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50
vim.opt.hlsearch = true

vim.opt.colorcolumn = "80"

vim.opt.showtabline = 0

vim.diagnostic.config({ severity_sort = true })

vim.o.clipboard = "unnamedplus"

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.completeopt = "menuone,noselect"
