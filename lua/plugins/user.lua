local utils = require "astroui"
local get_icon = utils.get_icon
local hop_mappings = {
  ["s"] = { "<cmd>HopChar1<CR>", desc = "Hop to a specific character" },
  ["<S-s>"] = { "<cmd>HopLine<CR>", desc = "Hop to a specific line" },
}
local sections = {
  s = { desc = get_icon("Session", 1, true) .. "Session" },
}

---@type LazySpec
return {
  {
    "catppuccin",
    ---@type CatppuccinOptions
    opts = {
      term_colors = true,
    },
  },
  { "ThePrimeagen/vim-be-good", event = "VeryLazy" },
  {
    "CrystalAlpha358/vim-mcfunction",
    ft = { "mcfunction", "bolt" },
  },
  {
    "Shatur/neovim-session-manager",
    dependencies = {
      {
        "astronvim/astrocore",
        ---@type AstroCoreOpts
        opts = {
          mappings = {
            n = {
              ["<Leader>s"] = sections.s,
              ["<Leader>sl"] = { "<cmd>SessionManager! load_last_session<cr>", desc = "Load last session" },
              ["<Leader>ss"] = { "<cmd>SessionManager! save_current_session<cr>", desc = "Save this session" },
              ["<Leader>sd"] = { "<cmd>SessionManager! delete_session<cr>", desc = "Delete session" },
              ["<Leader>sf"] = { "<cmd>SessionManager! load_session<cr>", desc = "Search sessions" },
              ["<Leader>s."] = {
                "<cmd>SessionManager! load_current_dir_session<cr>",
                desc = "Load current directory session",
              },
            },
          },
        },
      },
    },
    event = "BufWritePost",
    cmd = "SessionManager",
    enabled = vim.g.resession_enabled ~= false,
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
              ["<A-h>"] = { function() return vim.fn["codeium#Chat"]() end, desc = "Codeium Chat" },
            },
            i = {
              ["<A-y>"] = { function() return vim.fn["codeium#Accept"]() end, expr = true, desc = "Codeium Accept" },
              ["<C-;>"] = { function() return vim.fn["codeium#Clear"]() end, desc = "Codeium Clear" },
              ["<A-;>"] = { function() return vim.fn["codeium#Complete"]() end, desc = "Codeium Complete" },
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
