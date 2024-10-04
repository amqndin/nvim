local function switch_terminal_mode()
  if vim.bo.buftype == "terminal" then vim.cmd(vim.fn.mode() == "n" and "startinsert" or "stopinsert") end
end

---@type LazySpec
return {
  "AstroNvim/astrocore",
  opts = function(
    _,
    opts --[[@as AstroCoreOpts]]
  )
    local map = opts.mappings
    local buffer = require "astrocore.buffer"
    local vcount = vim.v.count

    -- switch between buffers
    map.n["L"] = {
      function() buffer.nav(vcount > 0 and vcount or 1) end,
      desc = "Next buffer",
    }
    map.n["H"] = {
      function() buffer.nav(-(vcount > 0 and vcount or 1)) end,
      desc = "Previous buffer",
    }

    -- terminal maps
    for _, mode in ipairs { "t", "i", "n" } do
      map[mode]["<F7>"] = false
    end

    map.i["<A-j>"] = { "<Esc><Cmd>ToggleTerm direction=float<CR>", desc = "Toggle terminal" }
    map.t["<A-j>"] = { "<Cmd>ToggleTerm direction=float<CR>", desc = "Toggle terminal" }
    map.n["<A-j>"] = { "<Cmd>ToggleTerm direction=float<CR>", desc = "Toggle terminal" }

    map.t["<S-Space>"] = { function() switch_terminal_mode() end, desc = "Switch terminal mode" }
    map.n["<S-Space>"] = { function() switch_terminal_mode() end, desc = "Switch terminal mode" }

    -- convenience maps
    map.x["/"] = { "<Esc>/\\%V", desc = "Search within selection" }
    map.x["<Leader>p"] = { '"_dP', desc = "Paste text without yanking selection" }
    map.n["<Leader>um"] = { "<Cmd>RenderMarkdown toggle<CR>", desc = "Toggle markdown render" }

    map.i["<C-BS>"] = { "<C-w>", desc = "Delete previous word" }
    map.c["<C-BS>"] = { "<C-w>", desc = "Delete previous word" }

    for _, mode in ipairs { "o", "t", "i", "x" } do
      map[mode]["<M-l>"] = { "<Esc>" }
    end

    map.x["@"] = {
      function() return ":norm @" .. vim.fn.getcharstr() .. "<cr>" end,
      desc = "Repeat macros across visual selection",
      silent = false,
      expr = true,
    }

    map.n["<Leader>."] = { ":lcd %:p:h<CR>", desc = "CD to current file" }
    map.n["G"] = { "Gzz", desc = "Scroll to bottom" }
    map.x["<"] = { "<gv", desc = "Deindent line" }
    map.x[">"] = { ">gv", desc = "Indent line" }

    -- add more text objects for "in" and "around"
    for _, char in ipairs { "_", ".", ":", ",", ";", "|", "/", "\\", "*", "+", "%", "`", "?" } do
      for _, mode in ipairs { "x", "o" } do
        map[mode]["i" .. char] = {
          string.format(":<C-u>silent! normal! f%sF%slvt%s<CR>", char, char, char),
          desc = "between " .. char,
        }
        map[mode]["a" .. char] = {
          string.format(":<C-u>silent! normal! f%sF%svf%s<CR>", char, char, char),
          desc = "around " .. char,
        }
      end
    end
  end,
}
