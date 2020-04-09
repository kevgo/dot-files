# Kevgo's Dot Files

## Platforms

- ChromeOS [installation](guides/chromeos.md), [cheatsheet](guides/chromeos-cheatsheet.md)
- Windows [installation](guides/windows.md)
- macOS [installation](guides/macos.md)
- Ubuntu [installation](guides/ubuntu.md)
- Manjaro Linux i3 [installation](guides/manjaro_i3.md), [cheatsheet](guides/i3_cheatsheet.md)
- Android [installation](guides/android.md)

## Applications

- [VSCode](guides/vscode.md)
- [RClone](guides/rclone.md)
- [Vim](guides/vim.md)

## How it works

Fish shell automatically keeps the local configuration in sync with Github:

- at the beginning of the day,
  when opening a new terminal window
  it pulls new changes from GitHub
- uncommitted changes to the local `.config` folder are indicated in the command prompt,
  reminding the user to commit and push them

### Folder structure

- [.config](.config): this gets symlinked as the `~/.config` folder
- [bin_folder](bin_folder): this folder gets symlinked into `~/bin` on unix-like operating systems
- [bin_windows](bin_windows): this folder gets symlinked into `~/bin` on Windows
- home_dir_files: files in here get symlinked into the home directory
- [scripts](scripts): installation scripts
- [guides](guides): installation guides
