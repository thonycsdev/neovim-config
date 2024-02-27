local map = function(mode, key, command)
  vim.api.nvim_set_keymap('n', 'C-s', ':PrettierAsync', { noremap = true, silent = true })
end

map()
