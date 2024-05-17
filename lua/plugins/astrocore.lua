-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
local _guifont = "JetBrainsMonoNL Nerd Font Mono:h13:w60"
if vim.g.neovide then _guifont = "JetBrainsMono Nerd Font:h12:w0" end

local function switch_terminal_mode()
  if vim.bo.buftype == "terminal" then
    if vim.fn.mode() == "n" then
      vim.cmd "startinsert"
    else
      vim.cmd "stopinsert"
    end
  end
end

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
        scrolloff = 8,
      },
      g = { -- vim.g.<key>
        -- global options
      },
      o = {
        guifont = _guifont,
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      c = {
        ["<C-BS>"] = { "<C-w>", desc = "Delete previous word" },
      },
      i = {
        ["<M-l>"] = { "<ESC>" },
        ["<A-j>"] = { "<Esc><Cmd>ToggleTerm<CR>", desc = "Toggle terminal" },
        ["<F7>"] = false,
        ["<C-BS>"] = { "<C-w>", desc = "Delete previous word" },
      },
      x = {
        ["<M-l>"] = { "<ESC>" },
        ["<Leader>p"] = { '"_dP', desc = "Paste text without yanking selection" },
      },
      t = {
        ["<A-j>"] = { "<Cmd>ToggleTerm<CR>", desc = "Toggle terminal" },
        ["<F7>"] = false,
        ["<S-Space>"] = { function() switch_terminal_mode() end, desc = "Toggle terminal vim mode" },
        ["<M-l>"] = { "<ESC>" },
      },
      n = {
        ["<A-j>"] = { '<Cmd>execute v:count . "ToggleTerm"<CR>', desc = "Switch terminal mode" },
        ["<F7>"] = false,
        ["<S-Space>"] = { function() switch_terminal_mode() end, desc = "Switch terminal mode" },
        ["{"] = { "{zz" },
        ["}"] = { "}zz" },
        ["<Leader>b"] = { desc = "Buffers" },
        L = {
          function() require("astrocore.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
          desc = "Next buffer",
        },
        H = {
          function() require("astrocore.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
          desc = "Previous buffer",
        },
      },
    },
  },
}
