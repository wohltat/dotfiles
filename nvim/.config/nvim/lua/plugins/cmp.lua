return {
  "saghen/blink.cmp",
  opts = function(_, opts)
    -- Create a toggle for enabling/disabling completion
    Snacks.toggle
      .new({
        id = "completion",
        name = "󰅺 Code Completion",
        get = function()
          return vim.b.completion or false
        end,
        set = function(state)
          vim.b.completion = state
          if state then
            require("blink.cmp").show()
          else
            require("blink.cmp").hide()
          end
        end,
      })
      :map("<leader>ucc")

    -- Dynamically enable or disable blink.cmp based on the completion state
    opts.enabled = function()
      return vim.b.completion
    end

    -- Configure additional options for blink.cmp
    opts.completion = {
      ghost_text = { enabled = true },
      menu = { enabled = true },
    }
    opts.sources = { min_keyword_length = 3 }

    return opts
  end,
}
