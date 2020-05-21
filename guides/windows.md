# Installation Instructions for Windows

### install Windows

from scratch:

- create USB installer
  - best to use Microsoft's [media creation tool](https://www.microsoft.com/en-us/software-download/windows10) for this
- on HP Spectre, hold `ESC` during power-up to see BIOS options

reinstall existing Windows:

1. hit `F11` during startup to boot into recovery mode
1. reset this PC

### set up Windows

1.  choose account
    - the online account syncs many of the settings but enforces username "kevin"
    - the local account can be named "kevlar"
1.  prevent slowness and heat before we start major filesystem activities
    - in Explorer: right-click C: drive > properties > disable content indexing
    - search for `Virus & threat protection` > Virus & thread protection settings > Manage settings > disable Real-time protection
1.  install Windows updates
1.  install [mac-precision-touchpad](https://github.com/imbushuo/mac-precision-touchpad) to make the Apple touchpad work

### Edge

- install Edge
- Edge extensions
  - uBlock
  - Grammarly

### Windows terminal

https://www.microsoft.com/en-us/p/windows-terminal/9n0dx20hk701?activetab=pivot:overviewtab

### Git

- [installer](https://git-scm.com/download/win)
- [create SSH key](https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent):
  - `ssh-keygen -t rsa -b 4096 -C "kevin.goslar@gmail.com" -P ""`
  - if the command hangs, provide the password via `-P ""`
  - if `ssh-agent` doesn't start, run `Set-Service ssh-agent -StartupType Manual` in admin PowerShell
- [add SSH key to Github](https://help.github.com/articles/adding-a-new-ssh-key-to-your-github-account)

### dot-files

```
git clone git@github.com:kevgo/dot-files.git .dot-files
```

in **cmd**:

```
mklink /J c:\Users\kevin\.dot-files\bin_window c:\Users\kevin\bin
```

### Make

```
choco install make
```

### Node.js

- [installer](https://nodejs.org/en/download)
- Yarn: `npm i -g yarn`

### Go

- [installer](https://golang.org/dl)

### Git Town

- [installer](https://github.com/Originate/git-town)
- install aliases: `git town alias true`

### diff-so-fancy

```
npm i -g diff-so-fancy
git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
```

### VSCode

- [installer](https://code.visualstudio.com)
- [configuration](../vscode/README.md)

### keyboard

- change keyboard delay and repeat rate: Control Panel > keyboard
- Map Caps Lock to Esc via [SharpKeys](https://github.com/randyrants/sharpkeys/releases)
- disable hotkey to change keyboard language: modern Settings app > Region and Language > Advanced keyboard settings > Language bar options > Advanced Key Settings tab

### Explorer

1. make Explorer open in `This PC`: Explorer > View > Options > Change folder and Search options > Open File Explorer to
1. customize start menu shortcuts: Search for `choose which folders appear on Start` > disable everything besides `Settings` > check by pressing Windows key and looking at the entries above the power icon

### Windows performance

1. disable Windows virtual memory
   - Windows search: advanced system settings
   - "Advanced" tab
   - "Performance" settings button
   - "Advanced" tab
   - "Virtual Memory" section > Change
   - "no paging file" option
1. disable file indexing on c: drive
1. disable Windows Defender (it makes Git slow)
   - run `regedit`
   - go to `HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender`
   - edit or create a DWORD (32 bit) called `DisableAntiSpyware` with value `1`
1. stop apps from starting automaticalyl
   - open task manager
   - go to `Startup` tab
   - right-click on entries and disable them

### sounds

- search for `change system sounds`
- set `Asterisk` and `Default Beep` to `(None)`

### remove bloatware

1. run [Windows10Debloater](https://github.com/Sycnex/Windows10Debloater)
1. in `cmd`: `bin\remove-win-apps.cmd`
1. remove "Edit with Paint3d" file context menu entry:
   - open `regedit`
   - go to `HKEY_LOCAL_MACHINE\SOFTWARE\Classes\SystemFileAssociations\.jpeg\Shell`
   - delete `3D Edit`
1. go to `Turn Windows features on or off` and disable all useless options
1. disable web results in Windows search
1. search for `mobile hotspot` and disable

### alternative: Fish shell via Cygwin

_problem: this is too unix-y for Windows. It creates a parallel universe inside the Cygwin environment that makes tools think they are in Unix and store the wrong line endings. Requires extensive symlinking of tools from the Unix simulator into the Windows user directory in order to work with Windows tools, or the Windows Go version._

6. [Cygwin](https://www.cygwin.com)

   - move the setup file to a new folder `~\cygwin-setup` before running it and keep it there.
   - choose packages
     - fish
     - git
     - make
     - vim
   - create shortcut to Fish shell:
     - run `cmd`
     - right-click in taskbar > Pin to taskbr
     - right-click again in taskbar > right-click on `Command Prompt` > Properties
     - change `Target` to `C:\cygwin64\bin\fish.exe --login --interactive --init-command=d`
     - add shortcut key `CTRL+SHIFT+T`
     - change icon to `c:\cygwin64\home\kevlar\.config\install\fish.ico`
   - add `c:\cygwin64\bin` and `c:\Users\kevlar\bin` to the PATH
