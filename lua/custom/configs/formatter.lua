local M = {

  filetype = {
    javascript = {
      require("formatter.filetypes.javascript").prettier
    },

    typescript = {
      require("formatter.filetypes.javascript").prettier
    },

    ["*"] = {
      require("formatter.filetypes.any").remove_trailing_whitespace
    }

  }
}


vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  command = "FormatWriteLock"
})

return M
