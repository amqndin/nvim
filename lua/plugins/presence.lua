local blacklist = {
  "antbot",
}

local function is_blacklisted(opts)
  for _, workspace in ipairs(blacklist) do
    if string.find(opts.workspace, workspace) then return true end
  end
  return false
end

return {
  "vyfor/cord.nvim",
  build = ":Cord update",
  opts = {
    enabled = true,
    log_level = vim.log.levels.OFF,
    editor = {
      client = "neovim",
      tooltip = "The Superior Text Editor",
      icon = nil,
    },
    display = {
      theme = "pastel",
      swap_fields = false,
      swap_icons = false,
    },
    timestamp = {
      enabled = true,
      reset_on_idle = false,
      reset_on_change = false,
    },
    idle = {
      enabled = true,
      timeout = 300000,
      show_status = true,
      ignore_focus = true,
      unidle_on_focus = true,
      smart_idle = true,
      details = "Idling",
      state = nil,
      tooltip = "💤",
      icon = nil,
    },
    text = {
      viewing = function(opts) return is_blacklisted(opts) and "Viewing a file" or ("Viewing " .. opts.filename) end,
      workspace = function(opts)
        return is_blacklisted(opts) and "In a secret workspace" or ("Working on " .. opts.workspace)
      end,
      editing = function(opts) return is_blacklisted(opts) and "Editing a file" or ("Editing " .. opts.filename) end,
      file_browser = function(opts) return "Browsing files in " .. opts.name end,
      plugin_manager = function(opts) return "Managing plugins in " .. opts.name end,
      lsp = function(opts) return "Configuring LSP in " .. opts.name end,
      docs = function(opts) return "Reading " .. opts.name end,
      vcs = function(opts) return "Committing changes in " .. opts.name end,
      notes = function(opts) return "Taking notes in " .. opts.name end,
      debug = function(opts) return "Debugging in " .. opts.name end,
      test = function(opts) return "Testing in " .. opts.name end,
      diagnostics = function(opts) return "Fixing problems in " .. opts.name end,
      games = function(opts) return "Playing " .. opts.name end,
      terminal = function(opts) return "Running commands in " .. opts.name end,
      dashboard = "Home",
    },
    buttons = {
      {
        label = "View Repository",
        url = function(opts) return opts.repo_url end,
      },
    },
    assets = {
      jmc = {
        name = "JMC",
        icon = "https://github.com/amqndin/nvim/blob/main/assets/presence/jmc.png?raw=true",
        tooltip = "JMC",
      },
      mcfunction = {
        name = "MCFunction",
        icon = "https://github.com/amqndin/nvim/blob/main/assets/presence/mcfunction.png?raw=true",
        tooltip = "MCFunction",
      },
    },
    variables = nil,
    plugins = nil,
    advanced = {
      plugin = {
        autocmds = true,
        cursor_update = "on_hold",
        match_in_mappings = true,
      },
      server = {
        update = "fetch",
        pipe_path = nil,
        executable_path = nil,
        timeout = 300000,
      },
      discord = {
        reconnect = {
          enabled = false,
          interval = 5000,
          initial = true,
        },
      },
    },
  },
}
