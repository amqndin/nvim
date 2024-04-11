---@type LazySpec
return {
  { "ThePrimeagen/vim-be-good", event = "VeryLazy" },
  {
    "echasnovski/mini.clue",
    config = function()
      local miniclue = require "mini.clue"
      miniclue.setup {
        window = { delay = 500 },
      }
    end,
  },
  {
    "CrystalAlpha358/vim-mcfunction",
    ft = { "mcfunction", "bolt" },
  },
  {
    "folke/noice.nvim",
    config = function()
      require("noice").setup {
        lsp = {
          hover = { enabled = false },
          signature = { enabled = false },
          progress = { enabled = false },
        },
        messages = { enabled = false },
        presets = {
          bottom_search = false, -- use a classic bottom cmdline for search
        },
      }
    end,
  },
  {
    "phaazon/hop.nvim",
    config = function() require("hop").setup { keys = "etovxqpdygfblzhckisuran" } end,
  },
  {
    "Exafunction/codeium.vim",
    config = function()
      vim.keymap.set("i", "<A-y>", function() return vim.fn["codeium#Accept"]() end, { expr = true })
      vim.keymap.set("i", "<A-]>", function() return vim.fn["codeium#CycleCompletions"](1) end, { expr = true })
      vim.keymap.set("i", "<A-[>", function() return vim.fn["codeium#CycleCompletions"](-1) end, { expr = true })
      vim.keymap.set("i", "<C-;>", function() return vim.fn["codeium#Clear"]() end, { expr = true })
      vim.keymap.set("n", "<A-h>", function() return vim.fn["codeium#Chat"]() end, { expr = true })
      vim.keymap.set("i", "<A-;>", function() return vim.fn["codeium#Complete"]() end, { expr = true })
    end,
  },
}
