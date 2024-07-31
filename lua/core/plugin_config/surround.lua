require("nvim-surround").setup({
  surrounds = {
    ["("] = {
      add = { "(", ")" },
      find = function() return require("nvim-surround.config").get_selection({ motion = "a(" }) end,
      delete = "^(.)().-(.)()$",
      change = {
        target = "^(.)().-(.)()$",
      },
    },
    ["{"] = {
      add = { "{", "}" },
      find = function() return require("nvim-surround.config").get_selection({ motion = "a{" }) end,
      delete = "^(.)().-(.)()$",
      change = {
        target = "^(.)().-(.)()$",
      },
    },
    ["["] = {
      add = { "[", "]" },
      find = function() return require("nvim-surround.config").get_selection({ motion = "a[" }) end,
      delete = "^(.)().-(.)()$",
      change = {
        target = "^(.)().-(.)()$",
      },
    },
    ["'"] = {
      add = { "'", "'" },
      find = function() return require("nvim-surround.config").get_selection({ motion = "a'" }) end,
      delete = "^(.)().-(.)()$",
      change = {
        target = "^(.)().-(.)()$",
      },
    },
    ['"'] = {
      add = { '"', '"' },
      find = function() return require("nvim-surround.config").get_selection({ motion = 'a"' }) end,
      delete = "^(.)().-(.)()$",
      change = {
        target = "^(.)().-(.)()$",
      },
    },
  }
})
