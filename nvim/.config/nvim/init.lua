-- vim.g.mapleader = " "
-- Set timeout length for mapped sequences (in milliseconds)
-- vim.o.timeoutlen = 50  -- Adjust the value as needed

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
--require("mini.animate").setup()

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function()
    -- Unmap the LSP's default mapping
    -- vim.api.nvim_del_keymap("n", "<A-n>")

    -- Remap Alt+n to your desired function
    vim.keymap.set("n", "<M-n>", "<backspace>", { noremap = true, silent = true })
  end,
})

function split_lines(str, delim)
  local m
  local n = 0
  local substr = str
  local lines = {}
  local ix_end

  repeat
    substr = string.sub(substr, n + 1, -1)
    m, n = string.find(substr, delim)
    if m == nil then
      ix_end = nil
    else
      ix_end = m - 1
    end

    local line = string.sub(substr, 1, ix_end)
    -- print(line, m, n)
    print(line)
    table.insert(lines, line)
  until m == nil
  return lines
end

vim.paste = (function(overridden)
  return function(lines, phase)
    -- dont copy selected text when pasting, like in any other program
    if vim.fn.mode() == "v" or vim.fn.mode() == "V" then
      vim.cmd('normal! "_dP')

      -- clear lines and return to prevent pasting twice
      lines = {}
      return overridden(lines, phase)
    end

    -- print(os.getenv("TMUX"))
    -- workaround for tmux not fully support bracketed paste
    local lines_new = {}
    if os.getenv("TMUX") ~= nil then
      local delimiter = "\27%[27;5;106~"
      for i, line in ipairs(lines) do
        local split_paste_line = split_lines(line, delimiter)
        for i, paste_line in ipairs(split_paste_line) do
          table.insert(lines_new, paste_line)
        end
      end
      -- print(vim.inspect(lines_new))
      return overridden(lines_new, phase)
    end

    return overridden(lines, phase)
  end
end)(vim.paste)
