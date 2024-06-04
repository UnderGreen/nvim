require("core")
require("extra")

-- Open file at last position using SHaDa
local lastplace = vim.api.nvim_create_augroup("LastPlace", { clear = true })
vim.api.nvim_create_autocmd('BufReadPost', {
  group = lastplace,
  callback = function(args)
    local valid_line = vim.fn.line([['"]]) >= 1 and vim.fn.line([['"]]) < vim.fn.line('$')
    local not_commit = vim.b[args.buf].filetype ~= 'commit'

    if valid_line and not_commit then
      vim.cmd([[normal! g`"]])
    end
  end,
})

vim.filetype.add({
  filename = {
    ["Jenkinsfile"] = "groovy",
  },
})
