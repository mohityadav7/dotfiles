local colorscheme = "monokai"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
  vim.notify("Colorscheme " .. colorscheme .. " not found!")
end

vim.cmd([[
  hi Normal guibg=NONE ctermbg=NONE
  highlight NonText ctermbg=NONE
]])
