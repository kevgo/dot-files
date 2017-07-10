# Kevgo's config files


## Installation

- install macOS updates

- install 1Password
  - Safari Extension
  - Chrome Extension
  - copy SSH files to `~/.ssh` and chmod to 600

- install homebrew

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
  defaults write com.apple.dock autohide-time-modifier -float 0.2 ; killall Dock
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
    - change Caps Lock to ESC (should be automatically with the new dotfiles)
- Karabiner
    - set keyboard repeat rate and initial delay
    - change option-right to forward-delete
    - (these settings should be automatic now)
- Chrome
    - sign in
- Firefox
- AdBlock
- GitX (http://rowanj.github.io/gitx)
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







## Maintenance

Once a day,
when opening a new terminal window
it pulls changes from GitHub.
It also prints uncommitted files in the `.config` folder.


## Files

All files here belong into the `~/.config` folder, except these ones:
- __bin_folder:__ this folder should be symlinked into `~/bin`
- __home_dir_files:__ these files should be located in the root directory
- __install:__ installation files

