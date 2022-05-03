local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  return
end

bufferline.setup {
  options = {
    numbers = "ordinal",
    -- offset bufferline when nvim-tree is opened
    offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
    -- chris had this changed from the default
    -- enforce_regular_tabs = true,
  },
  highlights = {
        fill = {
            guibg = { attribute = "bg", highlight = "FloatBorder" }, -- the "empty" part of the bufferline
        },
  }
}