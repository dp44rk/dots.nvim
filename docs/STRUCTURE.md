# dots.nvim Structure

## Boot Flow
1. `init.lua`
2. `lua/options.lua`
3. `lua/autocmd.lua`
4. `lua/keymaps.lua`
5. `lua/lazyplug.lua` (non-root only)
6. plugin specs in `lua/plugins/`

## Directory Layout
- `init.lua`: entrypoint.
- `lua/`: core Lua modules.
- `lua/plugins/`: lazy.nvim plugin specs and plugin-specific config.
- `lua/lsp/`: LSP attach handlers, diagnostics, rename helpers, icons.
- `after/ftplugin/`: per-filetype local settings/keymaps.
- `colors/`: local colorscheme files.
- `css/`: CSS assets used by markdown preview.
- `template/`: template snippets (e.g. `ps.cpp`).
- `docs/`: project maintenance docs.

## `lua/` Module Guide
- `lua/options.lua`: editor options, globals, clipboard setup.
- `lua/keymaps.lua`: global keymaps.
- `lua/autocmd.lua`: augroups/autocmd behavior.
- `lua/utils.lua`: utility helpers used across modules.
- `lua/lazyplug.lua`: lazy.nvim bootstrap + setup.
- `lua/workdirs.lua`: working directory list/utilities.

## `lua/plugins/` Guide
- `init.lua`: shared/general plugins.
- `which_key.lua`, `conform.lua`, `treesitter.lua`, `lspconfig.lua`, etc:
  feature-specific plugin config.
- subdirectories:
  - `dap/`: debugger modules
  - `fzf-lua/`: picker setup/mappings/cmd wrappers
  - `telescope/`: telescope setup/mappings/cmd wrappers
  - `heirline/`: statusline components
  - `mini/`, `devicons/`, `term/`: grouped plugin configs

## Refactoring Rules (Recommended)
- Keep each plugin in its own file under `lua/plugins/`.
- Prefer lazy.nvim `keys`/`event`/`ft` fields over top-level side effects.
- Keep filetype-specific logic in `after/ftplugin/`.
- Put reusable helper logic in `lua/utils.lua` or a focused module.
- Add new structure notes here when adding a new top-level directory.
