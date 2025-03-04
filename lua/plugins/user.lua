---@type LazySpec
return {
  {
    "catppuccin",
    opts = { term_colors = true },
  },
  { "ThePrimeagen/vim-be-good", cmd = "VimBeGood" },
  { "CrystalAlpha358/vim-mcfunction", ft = { "mcfunction" } },
  {
    "echasnovski/mini.splitjoin",
    keys = { { "gs", mode = { "n", "v" } } },
    opts = { mappings = { toggle = "gs" } },
  },
  {
    "folke/noice.nvim",
    opts = { lsp = { progress = { enabled = false } } },
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = { render_modes = { "n", "c", "t", "i" } },
  },
  {
    "supermaven-inc/supermaven-nvim",
    event = "User AstroFile",
    opts = {
      keymaps = {
        accept_suggestion = "<A-y>",
        clear_suggestion = "<C-h>",
        accept_word = "<C-l>",
      },
      ignore_filetypes = { "markdown", "neo-tree-popup" },
    },
  },
}
