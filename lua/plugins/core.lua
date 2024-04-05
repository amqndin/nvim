local minecraft_icon = {
  color = "#a6e3a1",
  icon = "󰍳",
  deviconscterm_color = "65",
  name = "minecraft",
}

---@type LazySpec
return {
  {
    "Shatur/neovim-session-manager",
    event = "BufWritePost",
    cmd = "SessionManager",
    enabled = vim.g.resession_enabled ~= false,
  },
  {
    "numToStr/Comment.nvim",
    config = function()
      local ft = require "Comment.ft"

      -- add support for other file types
      ft.set("mcfunction", "#%s")
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require "cmp"
      opts.sources = cmp.config.sources {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
        { name = "codeium" },
        { name = "nvim_lsp_signature_help" },
      }
      return opts
    end,
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    enabled = false,
  },
  -- customize alpha options
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      -- customize the dashboard header
      opts.section.header.val = {
        [[                               __                ]],
        [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
        [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
        [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
        [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
        [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
      }
      return opts
    end,
  },
  {
    "nvim-tree/nvim-web-devicons",
    opts = {
      override_by_extension = {
        jmc = minecraft_icon,
        mcfunction = minecraft_icon,
      },
    },
  },
  {
    "stevearc/resession.nvim",
    enabled = false,
  },
}
