return {
  "akinsho/toggleterm.nvim",
  event = "VeryLazy",
  config = function()
    local toggleterm = require("toggleterm")
    local Terminal = require("toggleterm.terminal").Terminal
    local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

    toggleterm.setup({
      size = 20,
      open_mapping = [[<c-\>]],
      hide_numbers = true,
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      insert_mappings = true,
      persist_size = true,
      direction = "float",
      close_on_exit = true,
      shell = vim.o.shell,
      float_opts = {
        border = "curved",
      },
    })

    function _LAZYGIT_TOGGLE()
      lazygit:toggle()
    end

    vim.api.nvim_set_keymap("n", "<leader>gt", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", { noremap = true, silent = true })
  end,
}
