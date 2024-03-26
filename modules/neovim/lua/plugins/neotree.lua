return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = function(_, opts)
      local filtered_items = opts.filesystem.filtered_items or {}
      filtered_items["hide_dotfiles"] = false
      filtered_items["hide_gitignored"] = true
      filtered_items["hide_by_name"] = {
        ".git"
      }

      opts.filesystem["filtered_items"] = filtered_items
    end,
  },
}

