local builtin = require("telescope.builtin")
local bind = require("mkashirin.remap").bind

require("telescope").setup({
  extensions = {
    file_browser = {
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
    }
  }
})
require("telescope").load_extension("file_browser")
require("telescope").load_extension("noice")

bind("n", "<C-p>", builtin.git_files)
bind("n", "<leader>ps", builtin.live_grep)
bind("n", "<leader>vh", builtin.help_tags)

bind(
  "n", "<space>fb",
  ":Telescope file_browser path=%:p:h select_buffer=true<CR>"
)
