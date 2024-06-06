---@type LazySpec
return {
  {
    "catppuccin",
    opts = { term_colors = true },
  },
  { "ThePrimeagen/vim-be-good", cmd = "VimBeGood" },
  {
    "CrystalAlpha358/vim-mcfunction",
    ft = { "mcfunction", "bolt" },
  },
  {
    "andweeb/presence.nvim",
    event = "VeryLazy",
    opts = {
      neovim_image_text = "The One True Text Editor", -- Text displayed when hovered over the Neovim image
      main_image = "neovim", -- Main image display (either "neovim" or "file")
      blacklist = { "antbot" }, -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
      file_assets = {
        jmc = { "JMC", "https://raw.githubusercontent.com/WingedSeal/jmc/webpage/src/assets/image/jmc_icon192.png" },
        mcfunction = {
          "MCFunction",
          "https://cdn.discordapp.com/emojis/1142345404403425341.webp?size=96&quality=lossless",
        },
      },
    },
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
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
      {
        "AstroNvim/astrocore",
        ---@type AstroCoreOpts
        opts = {
          mappings = {
            n = {
              ["<C-S-h>"] = { function() return vim.fn["codeium#Chat"]() end, desc = "Codeium Chat" },
            },
            i = {
              ["<A-y>"] = { function() return vim.fn["codeium#Accept"]() end, expr = true, desc = "Codeium Accept" },
              ["<C-;>"] = { function() return vim.fn["codeium#Clear"]() end, desc = "Codeium Clear" },
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
    opts = { lsp = { progress = { enabled = false } } }
  }
}
