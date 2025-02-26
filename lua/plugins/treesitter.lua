return {
  "nvim-treesitter/nvim-treesitter",
  event = "BufReadPost",
  config = function()
    require("nvim-treesitter.configs").setup {
      highlight = { enable = true },
      incremental_selection = { enable = true },
      indent = { enable = true }
    }
  end
}
