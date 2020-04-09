# Ubuntu Installation

- install hardware drivers

      sudo apt-get install lm-sensors fancontrol
      sudo sensors-detect
      sudo apt install acpi tlp

- install dependencies

      sudo apt-get install silversearcher-ag
      sudo npm install --global diff-so-fancy
      sudo npm install --global prettier

- install the .config folder

      git clone git@github.com:kevgo/dot-files.git ~/.config
      ~/.config/install/install.sh

- change Caps Lock key to ESC

      sudo apt-get install gnome-tweak-tool
      gnome-tweak-tool

  Go to `typing` > `Caps Lock key behavior`

* install Go

      mkdir -p ~/d/go/bin
      mkdir -p ~/d/go-external/bin

* clone Git Town

      mkdir -p ~/d/go/src/github.com/Originate
      cd ~/d/go/src/github.com/Originate
      git clone git@github.com:Originate/git-town.git
      cd git-town
      fish
      bin/build

  Set up the local API token to ship Git Town via the Github API from 1password.

* configure startup shell

      chsh -s /usr/bin/fish

* install Vim

      sudo apt-get install cmake build-essential python-dev python3-dev
      git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
      ~/.fzf/install
      curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
      vim +PlugInstall
      compile_youcompleteme
