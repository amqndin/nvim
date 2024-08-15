---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    -- add more things to the ensure_installed table protecting against community packs modifying it
    opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
      "lua",
      "typescript",
      "c",
      -- add more arguments for adding more treesitter parsers
    })

    opts.indent = {
      enable = true,
      disable = { "jmc", "typescript" },
    }

    vim.treesitter.language.register("typescript", "jmc")
    vim.treesitter.language.register("c", "hjmc")
    vim.treesitter.language.register("python", "bolt")
  end,
}
