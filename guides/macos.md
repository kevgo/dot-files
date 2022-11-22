# macOS Installation

- install macOS updates

- configure system preferences

  - keyboard 
    - Modifier Keys: change `Caps Lock` to `Esc`
    - shortcuts to jump to desktops

- install 1Password

  - copy SSH files to `~/.ssh` and chmod to 600

- install [Homebrew](https://brew.sh)

  ```
  brew doctor
  brew install git ag fish shellcheck diff-so-fancy
  ```

- install the `.config` folder

  ```
  git clone git@github.com:kevgo/dot-files.git ~/.dot-files
  ~/.config/install
  ```

- install Node

  ```
  brew install node yarn
  ```

- install Ruby

  ```
  brew install rbenv
  ```

- configure macOS

  ```
  # show dock faster
  defaults write com.apple.dock autohide-time-modifier -float 0.2 ; killall Dock

  # enable additional HiDPI modes for the Retina Macbook when connected to the TV
  sudo defaults write /Library/Preferences/com.apple.windowserver.plist DisplayResolutionEnabled -bool true
  ```

- install [Rust](https://rustup.rs)

- install GO

  ```
  brew install go 
  ```

- clone Git Town

  ```bash
  git clone git@github.com:git-town/git-town.git
  cd git-town
  fish
  make build
  ```

  Set up the local API token to ship Git Town via the Github API
  from 1password.

- configure Terminal

  - set `/opt/homebrew/bin/fish` as startup shell

- install NeoVim

  ```
  brew install neovim
  git clone --depth=1 https://github.com/savq/paq-nvim.git "$HOME/.local/share/nvim/site/pack/paqs/start/paq-nvim"
  ```

- [install VSCode](guides/vscode.md)

- install Emacs key bindings for shell

  ```
  git clone https://github.com/alexdavid/keybindings.git ~/Library/KeyBindings
  ```

- install AppStore apps

  - BetterSnapTool
    - configure
  - Skitch

- install visual apps

  - [Karabiner](https://pqrs.org/osx/karabiner/)
    - set keyboard repeat rate and initial delay
    - change option-right to forward-delete
    - (these settings should be automatic now)
  - [Chrome](https://www.google.com/chrome)
    - sign into Chrome
    - enter sync passphrase
    - sign into Zoom extension
    - hide the extension icons from the URL bar

- configure macOS

  - Finder Preferences
    - General: show home directory when opening new Finder windows (faster new Finder windows)
    - Sidebar: New Finder windows show (user directory)
    - Advanced: Don't show warnings before emptying the trash
  - System Preferences
    - Keyboard:
      - Text:
        - disable `Capitalize words automatically`
        - disable `Add period with double-space`
        - disable `Use smart quotes and dashes
      - Shortcuts:
        - Launchpad & Dock: disable shortcut for turning dock hiding on/off
        - App Shortcuts: enable `Show Help menu` and assign `[cmd]-M` to it (to disable minimizing windows)

## Archive

- install Postgres

  ```
  brew install postgres
  postgres -D /usr/local/var/postgres
  createdb
  psql
  ```
