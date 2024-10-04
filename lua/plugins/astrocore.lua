-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
local _guifont = "JetBrainsMonoNL Nerd Font Mono:h13:w60"
if vim.g.neovide then _guifont = "JetBrainsMono Nerd Font:h12.5:w0" end

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
    filetypes = {
      extension = {
        mcfunction = "mcfunction",
        mcmeta = "json",
        bolt = "bolt",
        jmc = "jmc",
        hjmc = "hjmc",
      },
    },
  },
}
