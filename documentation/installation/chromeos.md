## ChromeOS installation

### Backup old machine

- Quick Write snippets

### Settings

- Wifi connection: enable Google DNS
- install proprietary media components
- Screen lock > PIN or password
- Manage other people > disable guest and restrict login
- Wallpaper
- Keyboard
  - Caps Lock: change to `Escape`
  - set delay and repeat rate
- Displays > Display Size
- Linux: enable

Enable Hyperthreading:

- go to chrome://flags/#scheduler-configuration
- set to `performance`

Enable Reader mode:

- `chrome://flags/#enable-reader-mode`

### Folder sharing

- right click on `Downloads` folder, choose `Share with Linux`

### Set up dotfiles

- generate SSH key:

  ```
  ssh-keygen -t rsa -b 4096 -C "kevin.goslar@gmail.com"

  eval "$(ssh-agent -s)"
  ssh-add ~/.ssh/id_rsa
  sudo apt install xclip

  xclip -sel clip < ~/.ssh/id_rsa.pub
  ```

- register SSH key with GitHub: https://github.com/settings/keys
- clone the dotfiles:

      rm -rf .config
      git clone git@github.com:kevgo/dot-files.git .config

- install the symlinks: `.config/install/install.sh`

### Build tools

This installs `make` and the compilers needed for C extensions of Node.JS:

**NEXT TIME, TRY TO INSTALL THIS USING HOMEBREW FOR LINUX, SINCE IT HAS THE LATEST VERSIONS!**

https://docs.brew.sh/Homebrew-on-Linux

```
sudo apt update
sudo apt install -y build-essential
```

### Fish shell

```
brew install fish
```

- add `/home/linuxbrew/.linuxbrew/bin/fish` to `/etc/shells`
- set fish as default shell:

  ```
  sudo vim /etc/pam.d/chsh
  ```

  change: `auth required pam_shells.so` to
  `auth sufficient pam_shells.so`

  Now run: `chsh -s /usr/bin/fish`

- open a new terminal windows and fix Fish shell error messages
- disable glob

  ```
  set -U fish_features qmark-noglob
  ```

### Node.JS

```
brew install node yarn
```

Install diff-so-fancy:

```
npm i -g diff-so-fancy
```

### VSCode

- [download the DEB installer](https://code.visualstudio.com/download)
- `sudo apt install -y /mnt/chromeos/MyFiles/Downloads/code_*.deb`
- do the [VSCode setup](https://github.com/kevgo/dot-files/blob/master/documentation/vscode/README.md)

### Vim

```
brew install nvim

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

start nvim and run `:PlugInstall`

### Golang

```
brew install go ruby
```

- create a Go workspace

  ```
  mkdir -p ~/go/bin
  mkdir -p ~/go-external/bin
  ```

### Java

```
brew install openjdk
```

### Goland IDE

- [download Goland](https://www.jetbrains.com/go/download/#section=linux)
- install Goland:

  ```
  sudo tar xzf /mnt/chromeos/MyFiles/Downloads/goland-*.tar.gz -C /opt
  ```

- start Goland:

  ```
  /opt/GoLand-*/bin/goland.sh
  ```

### Git-LFS

```
brew install git-lfs
```

### Git Town

```
mkdir -p ~/go/src/github.com/Originate
cd ~/go/src/github.com/Originate
git clone git@github.com:Originate/git-town.git
cd git-town
make setup

make build
```

### Docker

```
brew install docker
```

### RipGrep

```
brew install ripgrep
```

### Time

```
brew install gnu-time
```
