local builtin = require('telescope.builtin')
vim.keymap.set('n', 'df', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', 'as', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ")});
end)

require('telescope').setup {
  -- other configurations...

  -- Configure find command to exclude node_modules
  defaults = {
    find_command = {'rg', '--no-ignore-vcs', '--files', '--hidden', '-g', '!.git', '-g', '!.node_modules'},
  },
}

