-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- Your global options/keymaps can stay here
vim.opt.clipboard = "unnamedplus"
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Setup lazy.nvim with the correct import order
require("lazy").setup({
    spec = {
        -- 1. FIRST: Load the core LazyVim framework plugins
        { "LazyVim/LazyVim", import = "lazyvim.plugins" },
        
        -- 2. SECOND: Load optional LazyVim extras (uncomment lines below to use them)
        -- { import = "lazyvim.plugins.extras.lang.typescript" },
        -- { import = "lazyvim.plugins.extras.formatting.prettier" },
        
        -- 3. FINALLY: Load your own custom plugins override directory
        { import = "plugins" },
    },
    -- Configure any other settings here.
    install = { colorscheme = { "moonfly" } },
    -- automatically check for plugin updates
})
