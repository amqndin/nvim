local hop_mappings = {
  ["s"] = { "<cmd>HopChar1<CR>", desc = "Hop to a specific character" },
  ["<S-s>"] = { "<cmd>HopLine<CR>", desc = "Hop to a specific line" },
}

---@type LazySpec
return {
  {
    "catppuccin",
    opts = { term_colors = true },
  },
  { "ThePrimeagen/vim-be-good", event = "VeryLazy" },
  {
    "CrystalAlpha358/vim-mcfunction",
    ft = { "mcfunction", "bolt" },
  },
  {
    "smoka7/hop.nvim",
    dependencies = {
      {
        "AstroNvim/astrocore",
        ---@type AstroCoreOpts
        opts = {
          mappings = {
            v = hop_mappings,
            n = hop_mappings,
            o = hop_mappings,
          },
        },
      },
    },
    opts = { keys = "etovxqpdygfblzhckisuran" },
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
    event = "BufEnter",
  },
  {
    "theprimeagen/harpoon",
    dependencies = {
      {
        "AstroNvim/astrocore",
        ---@type AstroCoreOpts
        opts = {
          mappings = {
            n = {
              ["<a-u>"] = { "<cmd>lua require('harpoon'):list():select(1)<CR>" },
              ["<a-i>"] = { "<cmd>lua require('harpoon'):list():select(2)<CR>" },
              ["<a-o>"] = { "<cmd>lua require('harpoon'):list():select(3)<CR>" },
              ["<a-p>"] = { "<cmd>lua require('harpoon'):list():select(4)<CR>" },
            },
          },
        },
      },
    },
    opts = {},
  },
  {
    "Zeioth/compiler.nvim",
    dependencies = {
      {
        "astronvim/astrocore",
        ---@type AstroCoreOpts
        opts = {
          mappings = {
            n = {
              ["<Leader>r"] = { "<cmd>CompilerOpen<cr>", desc = "Compile" },
            },
          },
        },
      },
    },
  },
}
