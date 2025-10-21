require('options')
require('plugins')
-- 加载 keymap.lua
require('keymap')

require("bufferline").setup{
  options = {
    mode = "tabs", -- 可以是 "buffers" 或 "tabs"
    separator_style = "thin", -- 可以是 "thin", "thick", 或 "slant"
    always_show_bufferline = true,
    show_buffer_close_icons = true,
    show_close_icon = true,
    color_icons = true
  }
}
require('ibl').setup({
  exclude = {
    filetypes = {
      'help',
      'startify',
      'aerial',
      'alpha',
      'dashboard',
      'packer',
      'neogitstatus',
      'NvimTree',
      'neo-tree',
      'Trouble',
    },
    buftypes = {
      'nofile',
      'terminal',
    },
  },
})


vim.cmd [[
  augroup TransparentBackground
    autocmd!
    autocmd VimEnter * hi Normal ctermbg=none guibg=none
    autocmd VimEnter * hi NormalNC ctermbg=none guibg=none
  augroup END
]]
