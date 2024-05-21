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
  -- { import = "astrocommunity.pack.python" },

  -- ui / small features
  { import = "astrocommunity.colorscheme.catppuccin" },
  { import = "astrocommunity.recipes.neovide" },

  -- major feature
  { import = "astrocommunity.diagnostics.trouble-nvim" },
  { import = "astrocommunity.editing-support.undotree" },
  { import = "astrocommunity.code-runner.compiler-nvim" },
  { import = "astrocommunity.motion.harpoon" },
  { import = "astrocommunity.motion.hop-nvim" },
}
