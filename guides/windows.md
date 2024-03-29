# Installation Instructions for Windows

### backup data on old Windows

- settings of new terminal

### install Windows

from scratch:

- create USB installer
  - best to use Microsoft's
    [media creation tool](https://www.microsoft.com/en-us/software-download/windows10)
    for this
- on HP Spectre, hold `ESC` during power-up to see BIOS options

reinstall existing Windows:

1. hit `F11` during startup to boot into recovery mode
1. reset this PC

### set up Windows

1. choose account
   - the online account syncs many of the settings but enforces username "kevin"
   - the local account can be named "kevlar"
1. prevent slowness and CPU heat before we start major filesystem activities
   - in Explorer: right-click C: drive > properties > disable content indexing
   - https://www.ghacks.net/2015/10/25/how-to-disable-windows-defender-in-windows-10-permanently`
   - disable search indexing: https://windowsreport.com/indexing-windows-8
   - [disable real-time scanning permanently](https://mspoweruser.com/how-to-temporarily-or-permanently-disable-and-re-enable-windows-defender-on-windows-10)
1. install Windows updates
1. install
   [mac-precision-touchpad](https://github.com/imbushuo/mac-precision-touchpad)
   to make the Apple touchpad work

### Edge

- install Edge
- Edge extensions
  - uBlock
  - Grammarly

### Windows terminal

- [installer](https://www.microsoft.com/en-us/p/windows-terminal/9n0dx20hk701?activetab=pivot:overviewtab)
- [settings](../windows/settings.json)

### Vim

NeoVim is needed as the editor for Git:

```
choco install neovim
```

### Git

- [installer](https://git-scm.com/download/win)

Create an SSH key:

- `ssh-keygen -t rsa -b 4096 -C "kevin.goslar@gmail.com" -P ""`
- if `ssh-agent` doesn't start, run `Set-Service ssh-agent -StartupType Manual`
  in admin PowerShell
- [add SSH key to Github](https://github.com/settings/keys)

Set up the signing key:

- create a file `private.key` containing the signing key from 1Password
- run `gpg --import private.key`
- `rm private.key`

### dot-files

```
git clone git@github.com:kevgo/dot-files.git .dot-files
git clone git@github.com:kevgo/dot-files-private.git .dot-files-private
```

in "cmd" shell with elevated privileges (start Admin PowerShell, then run
`cmd`):

```
mklink /J c:\Users\kevin\bin c:\Users\kevin\.dot-files\bin_windows
mklink /J C:\Users\kevin\.config C:\Users\kevin\.dot-files\.config
mklink C:\Users\kevin\.gitconfig C:\Users\kevin\.dot-files-private\home_dir_files\.gitconfig
mklink c:\Users\kevin\.bashrc c:\Users\kevin\.dot-files\windows\.bashrc
```

### Make

```
choco install make
```

### Go

- [installer](https://golang.org/dl)

### Node.js

- [installer](https://nodejs.org/en/download)
- Yarn: `npm i -g yarn`

### Git Town

- [installer](https://github.com/Originate/git-town)
- install aliases: `git town alias true`

### VSCode

- [installer](https://code.visualstudio.com)
- [configuration](../.config/Code/User/settings.json)

### keyboard

- change keyboard delay and repeat rate: Control Panel > keyboard
- Map Caps Lock to Esc via
  [SharpKeys](https://github.com/randyrants/sharpkeys/releases)
- disable hotkey to change keyboard language: modern Settings app > Region and
  Language > Advanced keyboard settings > Language bar options > Advanced Key
  Settings tab

### Explorer

1. make Explorer open in `This PC`: Explorer > View > Options > Change folder
   and Search options > Open File Explorer to
1. customize start menu shortcuts: Search for
   `choose which folders appear on Start` > disable everything besides
   `Settings` > check by pressing Windows key and looking at the entries above
   the power icon

### Windows performance

1. disable Windows virtual memory
   - Windows search: advanced system settings
   - "Advanced" tab
   - "Performance" settings button
   - "Advanced" tab
   - "Virtual Memory" section > Change
   - "no paging file" option
1. stop apps from starting automatically
   - open task manager
   - go to `Startup` tab
   - right-click on entries and disable them

### sounds

- search for `change system sounds`
- set to `(None)`: `Asterisk`, `Default Beep`, `Exclamation`, `Notification`,
  `Question`, `System Notification`

### remove bloatware

1. try https://github.com/builtbybel/bloatbox
1. run [Windows10Debloater](https://github.com/Sycnex/Windows10Debloater)
1. in `cmd`: `bin\remove-win-apps.cmd`
1. remove "Edit with Paint3d" file context menu entry:
   - open `regedit`
   - go to
     `HKEY_LOCAL_MACHINE\SOFTWARE\Classes\SystemFileAssociations\.jpeg\Shell`
   - delete `3D Edit`
1. go to `Turn Windows features on or off` and disable all useless options
1. disable web results in Windows search
1. search for `mobile hotspot` and disable
1. search for `turn windows features on or off` and disable most options there

### disable fast startup

https://www.computerhope.com/issues/ch001762.htm
