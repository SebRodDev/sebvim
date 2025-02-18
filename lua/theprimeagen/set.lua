vim.opt.guicursor = ""

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
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

-- Detect external changes to open files
vim.o.autoread = true
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
    command = "checktime",
})

-- Enable RegEx characters
vim.o.magic = true

-- Don't use two spaces when joining sentences
vim.o.joinspaces = false

-- Whitespace stuff
vim.o.list = true
vim.o.listchars = "tab:> ,lead:.,trail:·,multispace:.,extends:>,precedes:<,nbsp:~"

-- Highlight trailing whitespace
vim.cmd([[
    highlight TrailingWhitespace ctermfg=White ctermbg=LightRed guifg=#2d2a2e guibg=#ff6188
    match TrailingWhitespace /\s\+$/
]])

-- Restore position when re-opening files
vim.api.nvim_create_autocmd("BufReadPost", {
    group = vim.api.nvim_create_augroup("RestoreCursorPosition", { clear = true }),
    callback = function()
        local line = vim.fn["line"]("'\"")
        local lastline = vim.fn["line"]("$")
        local ignore_filetypes = {
            gitcommit = true,
            gitrebase = true,
            xxd = true,
            help = true,
        }
        if (line > 1) and (line <= lastline) and (ignore_filetypes[vim.bo.filetype] == nil) then
            vim.cmd([[normal! g'"]])
        end
    end,
})

-- Open new panes to the bottom/right
vim.o.splitbelow = true
vim.o.splitright = true

-- Treat *.h files as C, not C++
vim.g.c_syntax_for_h = 1

-- Use English dictionary for spell-check
vim.opt.spelllang = { "en" }

-- Shorten messages
-- Default is 'ltToOCF'
vim.o.shortmess = 'tToOCF'

-- Show matching braces while typing
vim.cmd([[set showmatch mat=3]])
vim.o.showmatch = true
vim.o.mat = 3

-- removing the feature of being compatible with Vi
vim.o.compatible = false

-- Detect external changes to open files
vim.o.autoread = true
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
    command = "checktime",
})

-- Auto-correct "ture" and "treu" to "true"
vim.keymap.set("ia", "ture", "true")
vim.keymap.set("ia", "treu", "true")

-- Auto-correct "deatil(s)" to "detail(s)"
vim.keymap.set("ia", "deatil", "detail")
vim.keymap.set("ia", "deatils", "details")
