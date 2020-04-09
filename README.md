# Kevgo's Dot Files

### platforms

- ChromeOS [installation](guides/chromeos.md), [cheatsheet](guides/chromeos-cheatsheet.md)
- Windows [installation](guides/windows.md)
- macOS [installation](guides/macos.md)
- Ubuntu [installation](guides/ubuntu.md)
- Manjaro i3 Linux [installation](guides/manjaro_i3.md), [cheatsheet](guides/i3_cheatsheet.md)
- Android [installation](guides/android.md)

### applications

- [VSCode](guides/vscode.md)
- [RClone](guides/rclone.md)
- [Vim](guides/vim.md)

### installation

- run `scripts/install` from your home directory

### configuration tracking via Fish shell

- the first time a new Fish shell opens each day it pulls changes from GitHub
- the Fish command prompt indicates uncommitted changes to the local `.config` folder

### what is where

- [.config](.config): this gets symlinked as the `~/.config` folder
- [bin_folder](bin_folder): this folder gets symlinked into `~/bin` on unix-like operating systems
- [bin_windows](bin_windows): this folder gets symlinked into `~/bin` on Windows
- [scripts](scripts): installation scripts
- [guides](guides): installation guides
