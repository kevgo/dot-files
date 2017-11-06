# Installation

- install macOS updates

- configure system preferences
  - keyboard shortcuts to jump to desktops

- install 1Password
  - copy SSH files to `~/.ssh` and chmod to 600

- install [Homebrew](https://brew.sh)

  ```
  brew doctor
  brew install git ag fish shellcheck ctags diff-so-fancy
  ```

- install Node

  ```
  brew install node yarn
  ```

- install Ruby

  ```
  brew install rbenv
  rbenv install 2.4.1
  ```
  
- configure macOS

  ```
  # show dock faster
  defaults write com.apple.dock autohide-time-modifier -float 0.2 ; killall Dock
  
  # enable additional HiDPI modes for the Retina Macbook when connected to the TV
  sudo defaults write /Library/Preferences/com.apple.windowserver.plist DisplayResolutionEnabled -bool true
  ```

- install the `.config` folder

  ```
  git clone git@github.com:kevgo/dot-files.git ~/.config
  ~/.config/install/install.sh
  ```
  
- install GO

  ```
  brew install go gotags
  mkdir -p ~/d/go/bin
  ```
  
- clone Git Town

  ```
  mkdir -p ~/d/go/src/github.com/Originate
  cd ~/d/go/src/github.com/Originate
  git clone git@github.com:Originate/git-town.git
  cd git-town
  bin/build
  ```
  
- set fish as startup shell in the Terminal app

- install Vim
  - install [MacVim](https://github.com/macvim-dev/macvim/releases)
  
  ```
  # cmake and node are needed for YouCompleteMe
  brew install cmake node
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  vim +PlugInstall
  compile_youcompleteme
  vim +GoInstallBinaries
  ```
  
- install Emacs key bindings for shell

  ```
  git clone https://github.com/alexdavid/keybindings.git ~/Library/KeyBindings
  ```

- install AppStore apps
  - Clear
    - configure
  - BetterSnapTool
    - configure
  - OmniFocus
  - Skitch
  - Slack

- install visual apps
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
  - [Skype](https://www.skype.com/en/download-skype/skype-for-computer)
  - 1Password Chrome and Safari extensions

- configure OS X
  - Finder Preferences
    - show home directory when opening new Finder windows (faster new Finder windows)

- install Gmail accounts and configure



## Archive

- install Postgres

  ```
  brew install postgres
  postgres -D /usr/local/var/postgres
  createdb
  psql
  ```
  
- CCMenu
  - Git Town: https://circleci.com/gh/Originate/git-town.cc.xml?ccmenu=cc.xml
