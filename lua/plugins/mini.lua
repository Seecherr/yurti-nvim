return {
  {
    "echasnovski/mini.nvim",
    version = false, -- Always use the latest version
    priority = 995,
    config = function()
      require("mini.pairs").setup()
      require("mini.surround").setup()
      require("mini.comment").setup()
    end,
  }
}

