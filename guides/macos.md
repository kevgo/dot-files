# macOS Installation

### 1Password

- set up
- copy SSH files to `~/.ssh` and chmod to 600

### MonitorControl

https://github.com/MonitorControl/MonitorControl

### Spotlight

- disable Spotlight search in entire home directory

### Alacritty

https://alacritty.org

### Git

(Git is already installed now)

### improve key bindings

```
git clone https://github.com/alexdavid/keybindings.git ~/Library/KeyBindings
```

following
https://superuser.com/questions/657724/how-to-remap-ctrlarrow-keys-to-move-word-to-word-for-mac,
add this to `~/Library/KeyBindings/DefaultKeyBinding.dict`:

```dict
{
  "^\UF702" = moveWordLeft:;
  "^\UF703" = moveWordRight:;
  "^$\UF702" = moveWordLeftAndModifySelection:;
  "^$\UF703" = moveWordRightAndModifySelection:;
}
```

### Homebrew

https://brew.sh

```
brew doctor
```

### Git LFS

```
brew install git-lfs
```

```
git-lfs install
```

### dot-files

```
git clone git@github.com:kevgo/dot-files.git ~/.dot-files
```

```
~/.config/install
```

### Fish shell

```
brew install fish
```

```
/opt/homebrew/bin/fish
```

Configure Terminal: set `/opt/homebrew/bin/fish` as startup shell.

### Rust

https://rustup.rs

### Go

```
brew install go
```

### Node

```
brew install node yarn
```

### Ruby

```
brew install rbenv
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

### developer directory

```
mkdir d
cd d
```

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

### Scroll Reverser

reverses mouse scroll direction

https://pilotmoon.com/scrollreverser

### Rectangle

organizing windows

https://rectangleapp.com

### show macOS dock faster

```
defaults write com.apple.dock autohide-time-modifier -float 0.2 ; killall Dock
```

### enable additional HiDPI modes when connected to the TV

```
sudo defaults write /Library/Preferences/com.apple.windowserver.plist DisplayResolutionEnabled -bool true
```

### enable repeating keys in the terminal

```
defaults write -g ApplePressAndHoldEnabled -bool false
```

### Keyboard settings

System Preferences / Keyboard:

- set speed
- Modifier Keys: change `Caps Lock` to `Esc`
- Text:
  - disable `Capitalize words automatically`
  - disable `Add period with double-space`
  - disable `Use smart quotes and dashes
- Shortcuts:
  - change shortcuts to jump to desktops
  - Launchpad & Dock: disable shortcut for turning dock hiding on/off
  - App Shortcuts: enable `Show Help menu` and assign `[cmd]-M` to it (to
    disable minimizing windows)

### Finder

Preferences:

- General: show home directory when opening new Finder windows (faster new
  Finder windows)
- Sidebar: New Finder windows show (user directory)
- Advanced: Don't show warnings before emptying the trash

## Postgres

```
brew install postgres
postgres -D /usr/local/var/postgres
createdb
psql
```

### Appstore

- Skitch

### Karabiner

https://pqrs.org/osx/karabiner

- set keyboard repeat rate and initial delay
- change option-right to forward-delete
- (these settings should be automatic now)

### Archive

In Appstore:

- BetterSnapTool

### DisplayBuddy

Installer is on Google Drive, license key is in 1password
