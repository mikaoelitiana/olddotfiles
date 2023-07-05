return {
  {
    "jcdickinson/codeium.nvim",
    commit = "b1ff0d6c993e3d87a4362d2ccd6c660f7444599f",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    config = function()
      require("codeium").setup({})
    end,
  },
}
