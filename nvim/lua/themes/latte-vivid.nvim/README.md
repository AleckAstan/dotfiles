# 🍦 latte-vivid.nvim

Un thème Neovim light et punchy, fait pour être lisible, coloré, et extensible.

## 📦 Installation

Utilise avec lazy.nvim :

```lua
{ dir = "~/path/to/latte-vivid.nvim" }
```

## 🧠 Utilisation

```lua
vim.cmd("colorscheme latte_vivid")
```

## 🔧 Personnalisation

Palette et groupes dans `lua/latte_vivid/` :
- `palette.lua` : toutes les couleurs
- `groups.lua` : mappage syntaxe/UI/treesitter
- `theme.lua` : charge les highlights

Prêt à être étendu : support plugin, dark mode, transparence, etc.
