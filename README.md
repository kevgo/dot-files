# @kevgo's dot-files

Cross-platform configuration for \*nix systems.

### installation

Platforms:

- ChromeOS [installation](guides/chromeos.md),
  [cheatsheet](guides/chromeos-cheatsheet.md)
- Fedora [installation](guides/fedora.md)
- Debian [installation](guides/debian.md)
- Android [installation](guides/android.md)
- Windows [installation](guides/windows.md)
- macOS [installation](guides/macos.md)

Applications:

- VSCode [installation](guides/vscode.md), [cheatsheet](guides/vscode_cheatsheet.md)
- RClone [installation](guides/rclone.md)
- Vim [cheatsheet](guides/vim_cheatsheet.md)

### how it works

Automatic synchronization:

- the first time a new Fish shell opens each day it pulls changes from GitHub
- the Fish command prompt indicates uncommitted changes in the local `.dot-files`
  folder

After cloning this repo and running [install](install) you have these folders and symlinks in your home directory:

- `.dot-files/`: this Git repo
- `.dot-files-private/`: separate Git repo for files containing private data
- `.config/` --> [.dot-files/.config](.config): app configuration tracked by Git
- `.gitconfig` --> `.dot-files-private/home_dir_files/.gitconfig`: global Git configuration tracked by private Git repo
