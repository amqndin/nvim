local minecraft_icon = {
  color = "#a6e3a1",
  icon = "󰍳",
  deviconscterm_color = "65",
  name = "minecraft",
}

---@type LazySpec
return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = { window = { position = "float" } },
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
        { name = "supermaven" },
        { name = "nvim_lsp_signature_help" },
      }
      return opts
    end,
  },
  { "nvim-telescope/telescope-fzf-native.nvim", enabled = false },
  -- customize alpha options
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      local utils = require "astroui"
      local get_icon = utils.get_icon
      local dashboard = require "alpha.themes.dashboard"
      -- customize the dashboard header
      opts.section.header.val = {
        [[                                                                     ]],
        [[       ████ ██████           █████      ██                     ]],
        [[      ███████████             █████                             ]],
        [[      █████████ ███████████████████ ███   ███████████   ]],
        [[     █████████  ███    █████████████ █████ ██████████████   ]],
        [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
        [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
        [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
      }
      dashboard.section.buttons.val = {
        dashboard.button("LDR n  ", get_icon("FileNew", 2, true) .. "New File  "),
        dashboard.button("LDR f f", get_icon("Search", 2, true) .. "Find File  "),
        dashboard.button("LDR f o", get_icon("DefaultFile", 2, true) .. "Recents  "),
        dashboard.button("LDR f w", get_icon("WordFile", 2, true) .. "Find Word  "),
        dashboard.button("LDR f '", get_icon("Bookmarks", 2, true) .. "Bookmarks  "),
        dashboard.button("LDR s l", get_icon("Refresh", 2, true) .. "Last Session  "),
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
}
