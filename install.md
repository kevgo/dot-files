# Installation

- install macOS updates

- install Chrome
  - sign in

- install 1Password
  - copy SSH files to `~/.ssh` and chmod to 600
  - Safari Extension
  - Chrome Extension

- install Homebrew

  ```
  brew doctor
  brew install git ag fish node yarn ctags shellcheck cmake go
  ```

- install Postgres

  ```
  brew install postgres
  postgres -D /usr/local/var/postgres
  createdb
  psql
  ```

- configure macOS

  ```
  # show dock faster
  defaults write com.apple.dock autohide-time-modifier -float 0.2 ; killall Dock

  # show new windows instantaneously
  defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool NO ; killall Finder
  ```

- install the `.config` folder

  ```
  git clone git@github.com:kevgo/dot-files.git .config
  .config/install/install.sh
  ```

- set fish as startup shell in the Terminal app

- install Emacs key bindings for shell

  ```
  git clone https://github.com/alexdavid/keybindings.git ~/Library/KeyBindings
  ```

- install visual apps
  - MacVim
    - copy the “mvim” binary to /usr/local/bin/vim
- Seil
    - change Caps Lock to ESC (should be there automatically with the new dotfiles)
- Karabiner
    - set keyboard repeat rate and initial delay
    - change option-right to forward-delete
    - (these settings should be automatic now)
- Firefox
- AdBlock
- GitHub Desktop
- OmniOutliner
- OmniGraffle
- Slack
- Skype

- install AppStore apps
  - CCMenu
    - Git Town: https://circleci.com/gh/Originate/git-town.cc.xml?ccmenu=cc.xml
  - Clear
    - configure
  - BetterSnapTool
    - configure

- configure OS X
  - Finder Preferences
    - show “kevin" when opening new Finder windows (faster new Finder windows)
  - enable additional HiDPI modes for the Retina Macbook when connected to the TV:

    ```
    sudo defaults write /Library/Preferences/com.apple.windowserver.plist DisplayResolutionEnabled -bool true
    ```

- install Gmail accounts and configure



