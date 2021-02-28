# Kevgo's Dot Files

### platforms

Linux:

- ChromeOS [installation](guides/chromeos.md),
  [cheatsheet](guides/chromeos-cheatsheet.md)
- Manjaro [installation](guides/manjaro.md)
- KDE [cheat sheet](guides/kde-cheatsheet.md)

other platforms:

- Android [installation](guides/android.md)
- Windows [installation](guides/windows.md)
- macOS [installation](guides/macos.md)

archive:

- [fix the HP UEFI setup](guides/fix-hp-uefi.md)
- Manjaro i3 [installation](guides/manjaro_i3.md),
  [cheatsheet](guides/i3_cheatsheet.md)
- Ubuntu [installation](guides/ubuntu.md)

### applications

- [VSCode](guides/vscode.md)
- [RClone](guides/rclone.md)
- [Vim](guides/vim.md)

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
