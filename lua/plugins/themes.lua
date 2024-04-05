---@type LazySpec
return {
  {
    "catppuccin/nvim",
    priority = 1000,
    config = function()
      require("catppuccin").setup {
        term_colors = true,
        -- dim_inactive = { enabled = true },
        integrations = {
          neotree = true,
          aerial = true,
          harpoon = true,
          hop = true,
          leap = true,
          bufferline = true,
          notify = true,
          mason = true,
          window_picker = true,
          which_key = true,
          indent_blankline = { enabled = true },
          -- telescope = { enabled = true, style = "classic" },
          noice = true,
          lsp_trouble = true,
        },
      }
    end,
    lazy = false,
  },
  { "AstroNvim/astrotheme" },
}
