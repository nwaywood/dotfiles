local wk = require("which-key")

-- keymaps
----------
wk.register({
  e = { ":NvimTreeToggle<cr>", "Toggle Explorer" },
  n = { ":NvimTreeFindFile<cr>", "Show in Explorer" },
}, { prefix = "<leader>"})

local nvim_tree_config = require "nvim-tree.config"
local tree_cb = nvim_tree_config.nvim_tree_callback

-- helper function to strip filename from end of path 
-- eg. /my/path/file.txt -> /my/path
local strip_filename_from_dir = function(path)
  -- split table on "/"
  sep = "/"
  local res={}
  for str in string.gmatch(path, "([^"..sep.."]+)") do
    table.insert(res, str)
  end
  -- check if last path section contains "."
  last = res[#res]
  if string.find(last,"%.") then
    -- last section is a filename, so strip
    table.remove(res, #res)
  end
  
  -- the leading "/" gets dropped, need to add it back
  return "/" .. table.concat(res, "/")
end

require'nvim-tree'.setup {
    disable_netrw = true, -- nvim-tree to override netrw
    view = {
        width = 40,
        mappings = {
          custom_only = false,
          list = {
            { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
            { key = "h", cb = tree_cb "close_node" },
            { key = "v", cb = tree_cb "vsplit" },
            { key = "s", cb = tree_cb "split" },
            { key = { "<tab>", "go" }, cb = tree_cb "preview" }, -- tab is default, want to add `go`
            { key = { "g?", "?" }, cb = tree_cb "toggle_help" }, -- g? is default, want to add `?`
            { key = "gs", action = "search_dir_in_telescope", action_cb = function(node)
                local final_path = strip_filename_from_dir(node.absolute_path)
                require'telescope.builtin'.live_grep({ search_dirs = { final_path }})
              end
            },
          },
        },
    },
    git = {
        ignore = false, -- display gitignored files
    },
    renderer = {
      group_empty = true, -- group empty dirs on one line like vscode
      highlight_git = true, -- color folder/file name to match its git status
    },
    -- settings for project.nvim
    update_cwd = true,
    update_focused_file = {
      enable = true,
      update_cwd = true
    },
}

-- autocmd to close vim if nvim-tree is last buffer open
vim.api.nvim_create_autocmd("BufEnter", {
  nested = true,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil then
      vim.cmd "quit"
    end
  end
})