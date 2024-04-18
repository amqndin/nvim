---@type LazySpec
return {
  { "ThePrimeagen/vim-be-good", event = "VeryLazy" },
  {
    "echasnovski/mini.clue",
    opts = {
      window = { delay = 400 },
    },
  },
  {
    "CrystalAlpha358/vim-mcfunction",
    ft = { "mcfunction", "bolt" },
  },
  {
    "folke/noice.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      require("noice").setup {
        lsp = {
          -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
            ["config.lsp.hover.enabled"] = false,
            ["config.lsp.signature.enabled"] = false,
          },
          hover = { enabled = false },
          signature = { enabled = false },
          progress = { enabled = false },
        },
        messages = { enabled = false },
        presets = {
          bottom_search = false, -- use a classic bottom cmdline for search
          command_palette = true, -- position the cmdline and popupmenu together
          long_message_to_split = true, -- long messages will be sent to a split
        },
      }
    end,
  },
  {
    "phaazon/hop.nvim",
    opts = { keys = "etovxqpdygfblzhckisuran" },
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
