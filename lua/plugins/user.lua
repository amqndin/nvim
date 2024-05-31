local utils = require "astroui"
local get_icon = utils.get_icon
local sections = {
  s = { desc = get_icon("Session", 0, true) .. "Session" },
}
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
      main_image        = "neovim",                   -- Main image display (either "neovim" or "file")
      blacklist         = { "antbot" },               -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
      file_assets       = {
        jmc = { "JMC", "https://raw.githubusercontent.com/WingedSeal/jmc/webpage/src/assets/image/jmc_icon192.png" },
        mcfunction = { "MCFunction", "https://cdn.discordapp.com/emojis/1142345404403425341.webp?size=96&quality=lossless" },
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
    "Shatur/neovim-session-manager",
    dependencies = {
      { "stevearc/resession.nvim", enabled = false },
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
              ["<Leader>s."] = { "<cmd>SessionManager! load_current_dir_session<cr>", desc = "Load current directory session", },
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
    event = "User AstroFile"
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
    event = "User AstroFile"
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
              ["<C-x>"] = false,
            },
          },
        },
      },
    },
    opts = {},
    event = "User AstroFile"
  },
}
