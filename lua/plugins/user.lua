---@type LazySpec
return {
  {
    "catppuccin",
    opts = { term_colors = true },
  },
  { "ThePrimeagen/vim-be-good", cmd = "VimBeGood" },
  {
    "CrystalAlpha358/vim-mcfunction",
    ft = { "mcfunction" },
  },
  {
    "echasnovski/mini.splitjoin",
    keys = {
      { "gs", mode = { "n", "v" } },
    },
    opts = {
      mappings = { toggle = "gs" },
    },
  },
  {
    "folke/noice.nvim",
    opts = { lsp = { progress = { enabled = false } } },
  },
  {
    "supermaven-inc/supermaven-nvim",
    -- enabled = false,
    opts = {
      keymaps = {
        accept_suggestion = "<A-y>",
        clear_suggestion = "<C-h>",
        accept_word = "<C-l>",
      },
    },
  },
}
