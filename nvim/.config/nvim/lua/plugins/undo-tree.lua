return {
  "jiaoshijie/undotree",
  dependencies = "nvim-lua/plenary.nvim",
  config = true,
  keys = { -- load the plugin only when using it's keybinding:
    { "<leader>uu", "<cmd>lua require('undotree').toggle()<cr>", desc = "undo-tree" },
    { "q", "<cmd>lua require('undotreeDiff').close()<cr>", desc = "undo-tree" },
  },
}
