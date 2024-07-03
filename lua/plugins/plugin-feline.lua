return {
  --https://github.com/famiu/feline.nvim
  "feline-nvim/feline.nvim",
  config = function()
    require("feline").setup()
    require("../plugins-config/feline")
  end,
}
