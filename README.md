# nvim

The way I like my Neovim personalized. Feel free copy/paste whatever looks
useful.

## Directory and File Structure

```text
┌── lua
├──── keithhand              # Personal configuration files (autocmds, keymaps, sets)
├──── plugin                 # Setup for third-party plugins
├────── config               # Individual configuration for each plugin
├────── imports.lua          # Plugin install definitions
├────── lazy.lua             # Initializes lazy.nvim
├──── lsps.lua               # Setup for LSP and friends
├── init.lua                 # Entrypoint script for Neovim
└── README.md                # <- You are here
```
