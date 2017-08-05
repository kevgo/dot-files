# Installation

- install macOS updates

- install 1Password
  - copy SSH files to `~/.ssh` and chmod to 600

- install Homebrew

  ```
  brew doctor
  brew install git ag fish vim shellcheck go  
  brew install node yarn ctags cmake 
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
  - [MacVim](https://github.com/macvim-dev/macvim/releases)
    - copy the “mvim” binary to /usr/local/bin/vim
    - Run `GoInstallBinaries` inside Vim
  - [Seil](https://pqrs.org/osx/karabiner/seil.html.en)
      - change Caps Lock to ESC (should be there automatically with the new dotfiles)
  - [Karabiner](https://pqrs.org/osx/karabiner/)
      - set keyboard repeat rate and initial delay
      - change option-right to forward-delete
      - (these settings should be automatic now)
  - [Chrome](https://www.google.com/chrome)
    - sign in
  - [Firefox](https://www.mozilla.org/en-US/firefox)
  - [AdBlock](https://getadblock.com)
  - [GitHub Desktop](https://desktop.github.com)
  - [OmniOutliner 4 Pro and OmniGraffle 5 Standard](https://www.omnigroup.com/download)
  - [Slack](https://slack.com/downloads)
  - [Skype](https://www.skype.com/en/download-skype/skype-for-computer)
  - 1Password Chrome and Safari extensions

- install AppStore apps
  - CCMenu
    - Git Town: https://circleci.com/gh/Originate/git-town.cc.xml?ccmenu=cc.xml
  - Clear
    - configure
  - BetterSnapTool
    - configure

- configure OS X
  - Finder Preferences
    - show home directory when opening new Finder windows (faster new Finder windows)
  - enable additional HiDPI modes for the Retina Macbook when connected to the TV:

    ```
    sudo defaults write /Library/Preferences/com.apple.windowserver.plist DisplayResolutionEnabled -bool true
    ```

- install Gmail accounts and configure
