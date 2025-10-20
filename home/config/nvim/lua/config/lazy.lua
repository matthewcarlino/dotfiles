
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
    end
end

-- Add Lazy to the runtimepath
---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

require("lazy").setup({
    -- "NMAC427/guess-indent.nvim",
    "lewis6991/gitsigns.nvim",		-- Adds git related signs to the gutter, as well as utilities for managing changes
    require("plugins.which-key"), 			-- The shelf that pops up at the bottom as you typw a key sequence 
    require("plugins.telescope"),			-- The centered search pop up

    -- LSP Plugins
    { "mason-org/mason.nvim", opts = {} },
    "mason-org/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    { "j-hui/fidget.nvim", opts = {} },
    require("plugins.lazydev"),
    require("plugins.blink"),
    require("config.lsp"),


    require("config.colors"),

    { "folke/todo-comments.nvim", event = "VimEnter", dependencies = { "nvim-lua/plenary.nvim" }, opts = { signs = false } },

    require("plugins.mini"),
    require("plugins.treesitter")
}, {
    rocks = { enabled = false },
})
