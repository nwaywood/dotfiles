local status_ok, onedark = pcall(require, "onedark")
if not status_ok then
  vim.notify("colorscheme not found!")
  return
end

onedark.setup {
    toggle_style_key = "<NOP>" -- disable keybinding for cycling through themes
}

onedark.load()
