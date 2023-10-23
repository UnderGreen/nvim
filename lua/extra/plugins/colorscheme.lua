return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      local catppuccin = require("catppuccin")
      local flavour = "macchiato"
      if vim.loop.os_uname().sysname == "Linux" then
        flavour = "frappe"
      end

      catppuccin.setup({
        flavour = flavour,
        background = { -- :h background
          light = "latte",
          dark = flavour,
        },
        custom_highlights = function(colors)
          return {
            NvimTreeIndentMarker = { fg = colors.blue },
          }
        end,
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          treesitter = true,
        },
      })
      -- load the colorscheme here
      vim.cmd([[colorscheme catppuccin]])
    end,
  },
}
