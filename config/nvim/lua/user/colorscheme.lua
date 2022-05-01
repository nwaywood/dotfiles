local status_ok, onedark = pcall(require, "onedark")
if not status_ok then
  vim.notify("colorscheme not found!")
  return
end

onedark.load()
