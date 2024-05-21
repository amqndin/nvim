local minecraft_icon = {
  color = "#a6e3a1",
  icon = "󰍳",
  deviconscterm_color = "65",
  name = "minecraft",
}

---@type LazySpec
return {
  {
    "numToStr/Comment.nvim",
    config = function()
      local ft = require "Comment.ft"

      -- add support for other file types
      ft.set("mcfunction", "#%s")
    end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = { position = "float" },
    },
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
      local utils = require "astroui"
      local get_icon = utils.get_icon
      local dashboard = require "alpha.themes.dashboard"
      -- customize the dashboard header
      opts.section.header.val = {
        -- [[                               __                ]],
        -- [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
        -- [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
        -- [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
        -- [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
        -- [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
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
  {
    "stevearc/resession.nvim",
    dependencies = {
      {
        "AstroNvim/astrocore",
        opts = function(_, opts)
          local maps = opts.mappings
          maps.n["<Leader>s"] = vim.tbl_get(opts, "_map_sections", "S")
          maps.n["<Leader>sl"] = { function() require("resession").load "Last Session" end, desc = "Load last session" }
          maps.n["<Leader>ss"] = { function() require("resession").save() end, desc = "Save this session" }
          maps.n["<Leader>sS"] = {
            function() require("resession").save(vim.fn.getcwd(), { dir = "dirsession" }) end,
            desc = "Save this dirsession",
          }
          maps.n["<Leader>st"] = { function() require("resession").save_tab() end, desc = "Save this tab's session" }
          maps.n["<Leader>sd"] = { function() require("resession").delete() end, desc = "Delete a session" }
          maps.n["<Leader>sD"] =
            { function() require("resession").delete(nil, { dir = "dirsession" }) end, desc = "Delete a dirsession" }
          maps.n["<Leader>sf"] = { function() require("resession").load() end, desc = "Load a session" }
          maps.n["<Leader>sF"] =
            { function() require("resession").load(nil, { dir = "dirsession" }) end, desc = "Load a dirsession" }
          maps.n["<Leader>s."] = {
            function() require("resession").load(vim.fn.getcwd(), { dir = "dirsession" }) end,
            desc = "Load current dirsession",
          }
          opts.autocmds.resession_auto_save = {
            {
              event = "VimLeavePre",
              desc = "Save session on close",
              callback = function()
                local buf_utils = require "astrocore.buffer"
                local autosave = buf_utils.sessions.autosave
                if autosave and buf_utils.is_valid_session() then
                  local save = require("resession").save
                  if autosave.last then save("Last Session", { notify = false }) end
                  if autosave.cwd then save(vim.fn.getcwd(), { dir = "dirsession", notify = false }) end
                end
              end,
            },
          }
        end,
      },
    },
  },
}
