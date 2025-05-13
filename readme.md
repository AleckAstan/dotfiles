# Dotfiles

This repository contains my personal dotfiles, designed for an efficient and streamlined development workflow. The setup includes window management, a powerful terminal configuration, and an optimized Neovim setup for TypeScript development.

## Features

- **Yabai**: A tiling window manager for macOS, configured for efficient workspace navigation.
- **skhd**: A hotkey daemon to control Yabai and other system actions.
- **Alacritty**: A fast, GPU-accelerated terminal emulator.
- **Tmux**: Terminal multiplexer for session management, configured to autosave sessions and automatically respawn them after a reboot.
- **Neovim**: A highly customized setup optimized for TypeScript and modern development workflows.

## Installation

To use these dotfiles, clone the repository and run the setup script:

```sh
git clone https://github.com/AleckAstan/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./install.sh  # Ensure you have execution permissions
```

### Dependencies
Ensure the following tools are installed before applying these configurations:
- Homebrew (for macOS package management)
- Yabai & skhd (`brew install yabai skhd`)
- Alacritty (`brew install --cask alacritty`)
- Tmux (`brew install tmux`)
- Neovim (`brew install neovim`)

## Neovim Setup for TypeScript

Neovim is configured to work seamlessly with TypeScript, featuring:
- **LSP support** (`typescript-language-server` via `nvim-lspconfig`)
- **Autocomplete** via `nvim-cmp`
- **Tree-sitter** for enhanced syntax highlighting
- **Telescope** for fuzzy finding
- **Keybindings** optimized for fast navigation and editing

## Usage

- **Window Management**: Use `skhd` shortcuts to control `yabai`.
- **Terminal Sessions**: Open `tmux` and manage multiple sessions. Tmux is configured to autosave sessions and automatically respawn them when rebooted.
- **Neovim for TypeScript**: Open `nvim` in a TypeScript project and enjoy a smooth coding experience.

## Customization

All configurations can be adjusted in their respective dotfiles:
- `~/.yabairc` (Yabai config)
- `~/.skhdrc` (skhd keybindings)
- `~/.alacritty.yml` (Alacritty settings)
- `~/.tmux.conf` (Tmux preferences)
- `~/.config/nvim/` (Neovim settings)

## Contributing
Feel free to fork and modify these dotfiles to fit your workflow. Pull requests are welcome!

## License
This repository is licensed under the MIT License.


