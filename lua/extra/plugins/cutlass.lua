return {
  "gbprod/cutlass.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    cut_key = "m",
    registers = {
      select = "s",
      delete = "d",
      change = "c",
    },
  },
}
