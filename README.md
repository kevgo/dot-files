# Kevgo's Dot Files

## Platforms

- ChromeOS [installation](documentation/installation/chromeos.md), [cheatsheet](documentation/chromeos-cheatsheet.md)
- Windows [installation](documentation/installation/windows.md)
- macOS [installation](documentation/installation/macos.md)
- Ubuntu [installation](documentation/installation/ubuntu.md)
- Manjaro Linux i3 [installation](documentation/installation/manjaro_i3.md), [cheatsheet](documentation/i3_cheatsheet.md)
- iOS [installation](documentation/installation/ios.md)

## Applications

- [Vim](documentation/vim.md)
- [VSCode](documentation/vscode/README.md)

## How it works

Fish shell automatically keeps the local configuration in sync with Github:

- at the beginning of the day,
  when opening a new terminal window
  it pulls new changes from GitHub
- uncommitted changes to the local `.config` folder are indicated in the command prompt,
  reminding the user to commit and push them

### Folder structure

All files here belong into the `~/.config` folder, except these ones:

- **bin_folder:** this folder should be symlinked into `~/bin`
- **home_dir_files:** these files should be located in the root directory
- **install:** installation files
- **documentation**
