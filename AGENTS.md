# Agent Guidelines for Tonitum Dotfiles

Personal dotfiles for Neovim, Bash, Tmux, Ghostty.


## Guidelines
- When communicating information to devs, be as concise as possible. Sacrifice grammar for the sake of concision.

## Build/Lint/Test Commands
- **Lua syntax**: `:luafile %` in Neovim or `lua -l <file>`
- **Bash syntax**: `bash -n <file>`
- **Run single test**: `<leader>tt` (neotest)
- **Run all tests in file**: `<leader>ta` (neotest)
- **Debug test**: `<leader>td` (neotest + DAP)
- **Manual testing**: Source configs (`source ~/.bashrc`) or restart tools

## Code Style Guidelines

### Lua (Neovim)
- 4 spaces indentation, 80 char lines
- Double quotes for strings, PascalCase user functions
- Imports at top with require(), vim.keymap.set() for mappings
- Plugin specs return tables with lazy loading, no italic comments/themes
- Options set via vim.opt table, functions use proper error handling

### Bash
- Standard conventions, conditional local config sourcing (`[ -f ~/.bash_local ] && source ~/.bash_local`)
- Functions with proper syntax, aliases for common commands
- Error handling with exit codes, proper quoting

## File Organization
- Plugins: `config/nvim/lua/tonitum/plugins/`
- Core config: `config/nvim/lua/tonitum/` (init.lua, options.lua, keymap.lua, autocommands.lua)
- Templates: `config/nvim/notes/templates/` and `config/nvim/notes/templates_work/`
