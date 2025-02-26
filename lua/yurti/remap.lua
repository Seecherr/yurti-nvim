-- General nvim keymaps
vim.g.mapleader = " "
-- Copy to clipboard
vim.keymap.set("v", "<leader>y", '"+y', { noremap = true, silent = true })
vim.keymap.set("n", "<leader>Y", '"+yg_', { noremap = true, silent = true })
vim.keymap.set("n", "<leader>y", '"+y', { noremap = true, silent = true })
vim.keymap.set("n", "<leader>yy", '"+yy', { noremap = true, silent = true })

-- Paste from clipboard
vim.keymap.set("n", "<leader>p", '"+p', { noremap = true, silent = true })
vim.keymap.set("n", "<leader>P", '"+P', { noremap = true, silent = true })
vim.keymap.set("v", "<leader>p", '"+p', { noremap = true, silent = true })
vim.keymap.set("v", "<leader>P", '"+P', { noremap = true, silent = true })

vim.keymap.set("n", "<leader>cv", vim.cmd.Ex)

-- Telescope plugin keymaps
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = 'Telescope find_files' })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>ft', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>ps', function() 
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
vim.keymap.set("n", "<leader>fh", function() 
    builtin.find_files {
        cwd = "~/.config/hypr"
    }
end)

-- Harpoon plugin keymaps 
vim.keymap.set("n", "<leader>a", function() require("harpoon.mark").add_file() end)
vim.keymap.set("n", "<leader>r", function() require("harpoon.mark").rm_file() end)
vim.keymap.set("n", "<C-e>", function() require("harpoon.ui").toggle_quick_menu() end)
vim.keymap.set("n", "<C-h>", function() require("harpoon.ui").nav_file(1) end)
vim.keymap.set("n", "<C-j>", function() require("harpoon.ui").nav_file(2) end)
vim.keymap.set("n", "<C-k>", function() require("harpoon.ui").nav_file(3) end)
vim.keymap.set("n", "<C-l>", function() require("harpoon.ui").nav_file(4) end)
vim.keymap.set("n", "<C-;>", function() require("harpoon.ui").nav_file(5) end)

-- Undotree plugin keymaps
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

