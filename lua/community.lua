-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  -- { dir = "D:/git repos/astrocommunity" },
  --
  -- languages support
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.go" },
  { import = "astrocommunity.pack.python" },

  -- ui / small features
  { import = "astrocommunity.recipes.vscode" },
  { import = "astrocommunity.keybinding.mini-clue" },
  -- { import = "astrocommunity.editing-support.nvim-treesitter-context" },
  { import = "astrocommunity.utility.noice-nvim" },
  { import = "astrocommunity.recipes.heirline-nvchad-statusline" },

  -- major feature
  { import = "astrocommunity.completion.codeium-vim" },
  { import = "astrocommunity.motion.harpoon" },
  { import = "astrocommunity.motion.hop-nvim" },
  { import = "astrocommunity.remote-development.nvim-sftp-sync" },
}
