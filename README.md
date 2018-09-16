# Kevgo's Dot Files

- macOS [installation](install_macos.md)
- ubuntu [installation](install_ubuntu.md)
- Manjaro i3 [installation](install_manjaro_i3.md), [cheatsheet](i3_cheatsheet.md)
- Windows [installation](install_windows.md)


## Details

- [Vim](vim.md)
- [VSCode](vscode/README.md)


## Folder structure

All files here belong into the `~/.config` folder, except these ones:
- __bin_folder:__ this folder should be symlinked into `~/bin`
- __home_dir_files:__ these files should be located in the root directory
- __install:__ installation files
- __vscode:__ VSCode documentation and config files


## How it works

- uncommitted changes in the `.config` folder are indicated in the command prompt
- once a day,
  when opening a new terminal window
  it pulls changes from GitHub.
