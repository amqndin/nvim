local utils = require "astroui"
local get_icon = utils.get_icon
local sections = {
  s = { desc = get_icon("Session", 0, true) .. "Session" },
}

return {
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
    event = "User AstroFile",
  },
}
