-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
local utils = require "astroui"
local get_icon = utils.get_icon
local sections = {
  s = { desc = get_icon("Session", 1, true) .. "Session" },
}
local _guifont = "JetBrainsMonoNL Nerd Font Mono:h13:w60"
if vim.g.neovide then _guifont = "JetBrainsMono Nerd Font:h12:w0" end
-- if vim.g.neovide then _guifont = "GeistMono Nerd Font:h13:w0" end

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 500, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        langmap = "йЙцЦуУкКеЕнНгГшШщЩзЗхХъЪфФыЫвВаАпПрРоОлЛдДжЖэЭяЯчЧсСмМиИтТьЬбБюЮ;qQwWeErRtTyYuUiIoOpP[{]}aAsSdDfFgGhHjJkKlL;:'\\\"zZxXcCvVbBnNmM\\,<.>",
        -- keymap = "russian-jcukenwin",
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "auto", -- sets vim.opt.signcolumn to auto
        wrap = false, -- sets vim.opt.wrap
      },
      g = { -- vim.g.<key>
        sftp_sync_servers = {
          yeggs = {
            local_path = "D:/GIT Repos/yeggs-map-jam/Map Jam Datapack",
            remote_path = "/world/datapacks/",
            host = "node.yeggs.org",
            port = 2022,
            username = "funcfusion.75eedb85",
            password = "funcfun21",
            -- type = "sftp",
          },
        },
      },
      o = {
        guifont = _guifont,
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      i = {
        ["<C-BS>"] = { "<C-w>", desc = "Delete previous word" },
      },
      x = {
        ["<Leader>p"] = { '"_dP', desc = "Paste text without yanking selection" },
      },
      t = {
        ["<esc><esc>"] = { "<c-\\><c-n>", desc = "Enter normal mode" },
      },
      n = {
        ["<leader>s"] = sections.s,
        ["<leader>sl"] = { "<cmd>SessionManager! load_last_session<cr>", desc = "Load last session" },
        ["<leader>ss"] = { "<cmd>SessionManager! save_current_session<cr>", desc = "Save this session" },
        ["<leader>sd"] = { "<cmd>SessionManager! delete_session<cr>", desc = "Delete session" },
        ["<leader>sf"] = { "<cmd>SessionManager! load_session<cr>", desc = "Search sessions" },
        ["<leader>s."] = {
          "<cmd>SessionManager! load_current_dir_session<cr>",
          desc = "Load current directory session",
        },
        -- second key is the lefthand side of the map
        ["<Leader>r"] = { desc = "Run this file as ..." },
        ["<Leader>rp"] = { '<cmd>!python "%"<CR>', desc = "Python" },
        ["<Leader>rn"] = { '<cmd>!node "%"<CR>', desc = "Nodejs" },
        ["<Leader>d"] = { desc = "Run this folder as ..." },
        ["<Leader>db"] = { "<cmd>!beet<CR>", desc = "Beet" },
        ["<Leader>dp"] = { "<cmd>!python .<CR>", desc = "Python" },
        ["<Leader>dn"] = { "<cmd>!node .<CR>", desc = "Nodejs" },

        -- navigate buffer tabs with `H` and `L`
        L = {
          function() require("astrocore.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
          desc = "Next buffer",
        },
        H = {
          function() require("astrocore.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
          desc = "Previous buffer",
        },

        -- mappings seen under group name "Buffer"
        ["<Leader>bD"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Pick to close",
        },
        -- tables with just a `desc` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        ["<Leader>b"] = { desc = "Buffers" },
      },
    },
  },
}
