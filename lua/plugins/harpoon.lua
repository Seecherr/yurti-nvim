return {
    {
        'ThePrimeagen/harpoon',
        lazy = true,
        keys = {
            { "<leader>a", desc = "Harpoon Add File" },
            { "<C-e>", desc = "Harpoon Menu" },
        },
        dependencies = {"nvim-lua/plenary.nvim"},
        config = function()
            require("harpoon").setup()
        end,
    }
}
