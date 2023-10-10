return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      local catppuccin = require("catppuccin")

      catppuccin.setup({
        flavour = "frappe",
        background = { -- :h background
          light = "latte",
          dark = "frappe",
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