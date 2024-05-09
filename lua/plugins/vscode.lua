-- don't do anything in non-vscode instances
if not vim.g.vscode then return {} end

-- a list of known working plugins with vscode-neovim, update with your own plugins
local plugins = {
  "lazy.nvim",
  "AstroNvim",
  "astrocore",
  "astroui",
  "Comment.nvim",
  "nvim-autopairs",
  "nvim-treesitter",
  "nvim-ts-autotag",
  "nvim-treesitter-textobjects",
  "nvim-ts-context-commentstring",
}

local Config = require "lazy.core.config"
-- disable plugin update checking
Config.options.checker.enabled = false
Config.options.change_detection.enabled = false
-- replace the default `cond`
Config.options.defaults.cond = function(plugin) return vim.tbl_contains(plugins, plugin.name) end

---@type LazySpec
return {
  -- add a few keybindings
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        n = {
          ["<Leader>ff"] = "<CMD>Find<CR>",
          ["<Leader>fw"] = "<CMD>call VSCodeNotify('workbench.action.findInFiles')<CR>",
          ["<Leader>ls"] = "<CMD>call VSCodeNotify('workbench.action.gotoSymbol')<CR>",
          ["<Leader>w"] = "<CMD>call VSCodeNotify('workbench.action.files.save')<CR>",
          ["<Leader>/"] = "<CMD>call VSCodeNotify('editor.action.commentLine')<CR>",
          ["<Leader>e"] = "<CMD>call VSCodeNotify('workbench.action.toggleSidebarVisibility')<CR>",
          ["<Leader>o"] = "<CMD>call VSCodeNotify('workbench.files.action.focusFilesExplorer')<CR>",
          ["<Leader>c"] = "<CMD>call VSCodeNotify('workbench.action.closeActiveEditor')<CR>",
          ["H"] = "<CMD>call VSCodeNotify('workbench.action.previousEditor')<CR>",
          ["L"] = "<CMD>call VSCodeNotify('workbench.action.nextEditor')<CR>",
          ["<Leader>q"] = "<CMD>call VSCodeNotify('workbench.action.closeWindow')<CR>",
          ["s"] = "<CMD>call VSCodeNotify('leap.findForward')<CR>",
          ["S"] = "<CMD>call VSCodeNotify('leap.findBackward')<CR>",
        },
        i = {
          ["jk"] = "<esc>",
        },
        o = {
          ["s"] = "<CMD>call VSCodeNotify('leap.findForward')<CR>",
          ["S"] = "<CMD>call VSCodeNotify('leap.findBackward')<CR>",
        },
        v = {
          ["s"] = "<CMD>call VSCodeNotify('leap.findForward')<CR>",
          ["S"] = "<CMD>call VSCodeNotify('leap.findBackward')<CR>",
        },
      },
    },
  },
  -- disable colorscheme setting
  { "AstroNvim/astroui", opts = { colorscheme = false } },
  -- disable treesitter highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { highlight = { enable = false } },
  },
}
