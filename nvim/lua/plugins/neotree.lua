if true then
  return {}
end
return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    window = {
      position = "right", -- Moves Neo-tree to the right
      width = 35, -- Adjust width as desired
    },

    filesystem = {
      filtered_items = {
        visible = true, -- Show hidden files (dotfiles)
        hide_dotfiles = false, -- Ensure dotfiles are not hidden
        show_hidden_count = true, -- Show a count of hidden files
        hide_gitignored = false, -- Show gitignored files
      },
      follow_current_file = true, -- Focus on the current file
      hijack_netrw = true, -- Replace netrw with neo-tree
    },
  },
}
