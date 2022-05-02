local lightbulb_group = vim.api.nvim_create_augroup("lightbulb", { clear = true })
vim.api.nvim_create_autocmd("CursorHold,CursorHoldI", {
  pattern = "*",
  callback = function()
      require'nvim-lightbulb'.update_lightbulb()
  end,
  group = lightbulb_group,
})