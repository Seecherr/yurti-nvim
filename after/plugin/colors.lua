
function ColorMyColors(color)
    color = color or "dracula"
    vim.api.nvim_set_hl(0, "Normal", { bg = "none"})
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none"})
end

ColorMyColors()
