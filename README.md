# Kevgo's Dot Files

### platforms

- ChromeOS [installation](guides/chromeos.md),
  [cheatsheet](guides/chromeos-cheatsheet.md)
- Fedora [installation](guides/fedora.md)
- Ubuntu [installation](guides/ubuntu.md)
- Android [installation](guides/android.md)
- Windows [installation](guides/windows.md)
- macOS [installation](guides/macos.md)

### applications

- VSCode [installation](guides/vscode.md), [cheatsheet](guides/vscode_cheatsheet.md)
- RClone [installation](guides/rclone.md)
- Vim [cheatsheet](guides/vim_cheatsheet.md)

### how it works

Creates this setup in your user directory:

- `.dot-files`: this repo
- `.dot-files-private`: separate repo with private info
- `.config` --> `.dot-files/.config`: config files tracked by Git
- `.gitconfig` --> `.dot-files-private/home_dir_files/.gitconfig`: Git configuration file mapped to home directory where Git looks for it
- `bin_linux` --> `.dot-files/bin_linux`: Linux tools
- `bin_chromeos` --> `.dot-files/bin_chromeos`: ChromeOS-specific Linux tools
- `bin_windows` --> `.dot-files/bin_windows`: Windows-specific CLI tools

The local Git repo is automatically syncronized with its remote once a day:

- the first time a new Fish shell opens each day it pulls changes from GitHub
- the Fish command prompt indicates uncommitted changes in the local `.dot-files`
  folder

### what is where

- [.config](.config): content for `~/.config/`
- [bin_chromeos](bin_chromeos): content for `~/bin_chromeos/` on ChromeOS
- [bin_linux](bin_linux): content for `~/bin_linux/` on unix-like operating systems
- [bin_windows](bin_windows): content for `~/bin/` on Windows
- [install](install): installation script
- [guides](guides): installation guides
- files containing confidential information are in a separate private repository
