vim.g.mapleader = " "
vim.keymap.set("n", "<leader>cd", vim.cmd.Ex)

-- neo-tree.nvim
vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<CR>", { desc = "Toggle Neo-tree Explorer" })

-- Define a function to toggle focus
local function toggle_neotree_focus()
    -- Check if the current buffer is the neo-tree buffer
    if vim.bo.filetype == "neo-tree" then
        -- If in neo-tree, jump right (to the file buffer)
        vim.cmd("wincmd l") -- Equivalent to <C-w>l
    else
        -- If not in neo-tree, focus the neo-tree window
        -- The 'focus' command will open it if closed and set focus
        vim.cmd("Neotree focus")
    end
end

-- Map your desired key sequence to the function
-- NOTE: You must use the <Cmd>...<CR> format with `vim.keymap.set`
vim.keymap.set("n", "<leader>o", toggle_neotree_focus, { desc = "Toggle Focus: File <-> Neo-tree" })
