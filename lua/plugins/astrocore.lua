-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
local _guifont = "JetBrainsMonoNL Nerd Font Mono:h13:w60"
if vim.g.neovide then _guifont = "JetBrainsMono Nerd Font:h12.5:w0" end

local function move_to_paragraph(direction)
  local current_line = vim.fn.line "."
  local search_flags = direction == "next" and "n" or "bn"
  local next_line = vim.fn.search("^\\s*$", search_flags) or 0

  if (direction == "next" and current_line >= next_line) or (direction == "prev" and current_line <= next_line) then
    vim.cmd("norm! " .. (direction == "next" and "G" or "gg"))
  else
    vim.fn.search("^\\s*$", direction == "next" and "" or "b")
  end
end

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
    options = { -- vim.<key>
      opt = {
        langmap = "йЙцЦуУкКеЕнНгГшШщЩзЗхХъЪфФыЫвВаАпПрРоОлЛдДжЖэЭяЯчЧсСмМиИтТьЬбБюЮ;qQwWeErRtTyYuUiIoOpP[{]}aAsSdDfFgGhHjJkKlL;:'\\\"zZxXcCvVbBnNmM\\,<.>",
        relativenumber = true,
        signcolumn = "yes",
        sidescrolloff = 10,
        scrolloff = 8,
        number = true,
        spell = false,
        wrap = false,
      },
      g = {
        neovide_no_idle = true,
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
      o = {
        ["<M-l>"] = { "<ESC>" },
      },
      i = {
        ["<F7>"] = false, -- disable default keymap for toggling terminal
        ["<A-j>"] = { "<Esc><Cmd>ToggleTerm direction=float<CR>", desc = "Toggle terminal" },
        ["<M-l>"] = { "<ESC>" },
        ["<C-BS>"] = { "<C-w>", desc = "Delete previous word" },
      },
      x = {
        ["/"] = { "<Esc>/\\%V" },
        ["<M-l>"] = { "<ESC>" },
        ["<Leader>p"] = { '"_dP', desc = "Paste text without yanking selection" },
        ["{"] = { function() move_to_paragraph "prev" end },
        ["}"] = { function() move_to_paragraph "next" end },
      },
      t = {
        ["<F7>"] = false,
        ["<A-j>"] = { "<Cmd>ToggleTerm direction=float<CR>", desc = "Toggle terminal" },
        ["<M-l>"] = { "<ESC>" },
        ["<S-Space>"] = { function() switch_terminal_mode() end, desc = "Switch terminal mode" },
        ["{"] = { function() move_to_paragraph "prev" end },
        ["}"] = { function() move_to_paragraph "next" end },
      },
      n = {
        ["<F7>"] = false,
        ["<A-j>"] = { '<Cmd>execute v:count . "ToggleTerm direction=float"<CR>', desc = "Toggle terminal" },
        ["<S-Space>"] = { function() switch_terminal_mode() end, desc = "Switch terminal mode" },
        ["{"] = { function() move_to_paragraph "prev" end },
        ["}"] = { function() move_to_paragraph "next" end },
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
    filetypes = {
      extension = {
        mcfunction = "mcf",
        foo = "fooscript",
        mcmeta = "json",
        bolt = "bolt",
        jmc = "jmc",
        hjmc = "hjmc",
      },
      filename = {
        ["Foofile"] = "fooscript",
      },
      pattern = {
        ["~/%.config/foo/.*"] = "fooscript",
      },
    },
    autocmds = {
      qflist_keymaps = {
        {
          event = { "FileType" },
          pattern = "qf",
          desc = "Quickfix Mappings",
          callback = function()
            vim.keymap.set("n", "<C-j>", "<Cmd>cnext!<CR>", { buffer = true, silent = true })
            vim.keymap.set("n", "<C-k>", "<Cmd>cprev!<CR>", { buffer = true, silent = true })
            vim.keymap.set("n", "l", "<CR>", { buffer = true, silent = true })
            vim.keymap.set("n", "gg", "<Cmd>cfirst!<CR>", { buffer = true, silent = true })
            vim.keymap.set("n", "G", "<Cmd>clast!<CR>", { buffer = true, silent = true })
          end,
        },
      },
    },
  },
}
