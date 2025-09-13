
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.o.number = true

vim.o.shiftwidth = 4 -- Might be replaced with NMAC427/guess-indent.nvim
vim.o.breakindent = true

-- disable the mouse altogether
vim.o.mouse = ""

-- mode will be displayed in the status line, so it is not needed in the usual place
vim.o.showmode = false

-- More intuitive copy paste between apps
vim.schedule(function()
    vim.o.clipboard = "unnamedplus"
end)

vim.o.undofile = true
vim.o.directory = os.getenv("HOME") .. "/.local/tmp/swap"
vim.o.backupdir = os.getenv("HOME") .. "/.local/tmp/backup"
vim.o.undodir = os.getenv("HOME") .. "/.local/tmp/undo"

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

-- Gutter for symbolic line indicators
vim.o.signcolumn = "yes"

-- Time to wait before writing to swap file
vim.o.updatetime = 251

-- Decrease mapped sequence wait time
vim.o.timeoutlen = 300

-- Configure how new splits should be opened
-- vim.o.splitright = true
-- vim.o.splitbelow = true

-- Some visual whitespace indicators?
-- Shows little dots for trailing spaces, for example
vim.o.list = true
vim.opt.listchars = { tab = "  ", trail = "·", nbsp = "␣" }

-- Shows effect of substitute commands
vim.o.inccommand = "split" --  Use a preview window, 'nosplit' keeps it in buffer

-- Highlight the line that the cursor is on
vim.o.cursorline = true

-- Keep this number of lines above and below the cursor
vim.o.scrolloff = 5

-- Confirmation dialog
vim.o.confirm = true
