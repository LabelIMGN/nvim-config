require('lualine').setup{
    options = {
        icons_enabled = true,
        theme = 'auto',
    },
    sections = {
        lualine_a = {
            {
                'filename', 
                path = 1,
            }
        },
        lualine_z = {
          {
            'datetime',
            style = ('%I:%M%p'),
          }
        }
    }
}
