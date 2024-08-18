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
    "Exafunction/codeium.vim",
    enabled = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
      {
        "AstroNvim/astrocore",
        ---@type AstroCoreOpts
        opts = {
          mappings = {
            i = {
              ["<A-y>"] = { function() return vim.fn["codeium#Accept"]() end, expr = true, desc = "Codeium Accept" },
              ["<C-h>"] = { function() return vim.fn["codeium#Clear"]() end, desc = "Codeium Clear" },
            },
          },
        },
      },
    },
    config = function() vim.g.codeium_disable_bindings = 1 end,
    event = "User AstroFile",
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
