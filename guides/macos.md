# macOS Installation

### show macOS dock faster

```
defaults write com.apple.dock autohide-time-modifier -float 0.2 ; killall Dock
```

### enable repeating keys in the terminal

```
defaults write -g ApplePressAndHoldEnabled -bool false
```

### Al dente

https://apphousekitchen.com

### System Preferences

- Spotlight
  - disable Spotlight search in entire home directory
- Keyboard
  - text input / input sources
    - set layout to Dvorak only
    - disable `Capitalize words automatically`
    - disable `Add period with double-space`
    - disable `Use smart quotes and dashes
  - set speed
  - Shortcuts:
    - Modifier Keys: change `Caps Lock` to `Esc`
    - Launchpad & Dock: disable shortcut for turning dock hiding on/off
    - App Shortcuts: enable `Show Help menu` and assign `[cmd]-M` to it (to
      disable minimizing windows)
    - go through all other categories and disable as needed

### MonitorControl

https://github.com/MonitorControl/MonitorControl

### Homebrew

https://brew.sh

```
brew doctor
```

### Git

```
brew install git git-lfs gpg
```

```
git-lfs install
```

### dot-files

```
git clone git@github.com:kevgo/dot-files.git ~/.dot-files
```

```
~/.dot-files/install
```

### Fish shell

```
brew install fish
```

```
/opt/homebrew/bin/fish
```

### Terminal

Settings:

- General
  - shell opens with: `/opt/homebrew/bin/fish`
- Profiles
  - Shell
    - Ask before closing: never
  - Advanced
    - Audible bell: off

### Rust

https://rustup.rs

### Go

```
brew install go
```

or https://go.dev/dl

### Git Town

```
git clone git@github.com:git-town/git-town.git
```

```
cd git-town
```

```
make build
```

Set up the local API token to ship via the Github API from 1password.

### Node

```
brew install node yarn
```

### NeoVim

```
brew install neovim
```

```
git clone --depth=1 https://github.com/savq/paq-nvim.git "$HOME/.local/share/nvim/site/pack/paqs/start/paq-nvim"
```

### VSCode

[installer](vscode.md)

Symlink the config directory to the location on macOS:

```
ln -s ~/.config/Code/User/ "~/Library/Application Support/Code/User"
```

### developer directory

```
mkdir d
cd d
```

### bat

```
brew install bat
```

### RipGrep

```
brew install ripgrep
```

### Tikibase

```
git clone git@github.com:kevgo/tikibase.git
```

```
cd tikibase
```

```
make install
```

### dprint

```
brew install dprint
```

### Notes

```
git clone git@github.com:kevgo/notes.git
```

### TextEdit

Settings:

- New Document
  - "Plain text"
  - Width: 96 chars
  - Height: 30 lines
  - Plain text font: 18 pt

Make TextEdit show an empty file when opening:

```zsh
defaults write -g NSShowAppCentricOpenPanelInsteadOfUntitledFile -bool false
```

### Rectangle

organizing windows

https://rectangleapp.com

### DisplayBuddy

Installer is on Google Drive, license key is in 1password

### Finder

Preferences:

- General: show home directory when opening new Finder windows (faster new
  Finder windows)
- Sidebar: New Finder windows show (user directory)
- Advanced: Don't show warnings before emptying the trash

### Karabiner

Karabiner interferes with Fluor and isn't really needed, so better to not
install it at all.

https://pqrs.org/osx/karabiner

- set keyboard repeat rate and initial delay
- change option-right to forward-delete
- (these settings should be automatic now)

### set Dvorak layout for login screen

At the login screen:

- click on the keyboard layout selector in the menu bar
- remove the "US" option by choosing "remove current entry"

### disable start when opening lid or connecting to power

```
sudo nvram BootPreference=%00
```

[more info](https://www.xda-developers.com/apple-is-fixing-major-issue-with-macbooks)

### Scroll Reverser

reverses mouse scroll direction

https://pilotmoon.com/scrollreverser

## Archive

### Fluor

Flour is really nice but unfortunately not compatible with Karabiner Elements: https://github.com/Pyroh/Fluor/issues/90

https://github.com/Pyroh/Fluor/releases

### Postgres

```
brew install postgres
postgres -D /usr/local/var/postgres
createdb
psql
```

In Appstore:

- BetterSnapTool

### enable additional HiDPI modes when connected to the TV

```
sudo defaults write /Library/Preferences/com.apple.windowserver.plist DisplayResolutionEnabled -bool true
```

### Ruby

```
brew install rbenv
```
