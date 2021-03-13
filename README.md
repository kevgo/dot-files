# Kevgo's Dot Files

### platforms

- ChromeOS [installation](guides/chromeos.md),
  [cheatsheet](guides/chromeos-cheatsheet.md)
- Ubuntu [installation](guides/ubuntu.md)
- Android [installation](guides/android.md)
- Windows [installation](guides/windows.md)
- macOS [installation](guides/macos.md)

### applications

- VSCode [installation](guides/vscode.md), [cheatsheet](guides/vscode_cheatsheet.md)
- RClone [installation](guides/rclone.md)
- Vim [cheatsheet](guides/vim_cheatsheet.md)

### installation

- run `scripts/install` from your home directory

### configuration tracking via Fish shell

- the first time a new Fish shell opens each day it pulls changes from GitHub
- the Fish command prompt indicates uncommitted changes to the local `.config`
  folder

### what is where

- [.config](.config): content for `~/.config/`
- [bin_folder](bin_folder): content for `~/bin/` on unix-like operating systems
- [bin_windows](bin_windows): content for `~/bin/` on Windows
- [install](install): installation script
- [guides](guides): installation guides
- files containing confidential information are in a separate private repository
