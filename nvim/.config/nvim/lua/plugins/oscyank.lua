return {
  "ojroques/nvim-osc52",
  event = "VeryLazy",
  config = function()
    require("osc52").setup({
      max_length = 0, -- unlimited
      silent = false, -- disable messages
      trim = false, -- do not trim text
    })

    -- Auto copy on yank
    local function copy()
      if vim.v.event.operator == "y" and vim.v.event.regname == "" then
        require("osc52").copy_register("")
      end
    end

    vim.api.nvim_create_autocmd("TextYankPost", { callback = copy })
  end,
}
