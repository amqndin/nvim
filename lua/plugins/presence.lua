return {
  "andweeb/presence.nvim",
  event = "VeryLazy",
  opts = {
    neovim_image_text = "In Neovim we trust", -- Text displayed when hovered over the Neovim image
    main_image = "neovim", -- Main image display (either "neovim" or "file")
    blacklist = {
      "antbot",
    }, -- if the current file name, path, or workspace matches rpc is disabled
    file_assets = {
      jmc = {
        "JMC",
        "https://raw.githubusercontent.com/WingedSeal/jmc/webpage/src/assets/image/jmc_icon192.png",
      },
      mcfunction = {
        "MCFunction",
        "https://cdn.discordapp.com/emojis/1142345404403425341.webp?size=96&quality=lossless",
      },
    },
  },
}
