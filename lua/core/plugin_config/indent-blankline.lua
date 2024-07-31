require("ibl").setup {
  indent = {
    char = "│",
  },
  scope = {
    show_start = true,
    show_end = true,
  },
  exclude = {
    buftypes = {"terminal"},
    filetypes = {"help", "dashboard", "packer", "NvimTree"},
  },
}
