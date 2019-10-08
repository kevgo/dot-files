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
sudo apt install -y build-essential ruby
```

### Fish shell

```
sudo apt install -y fish
```

- start fish and fix error messages
- set fish as default shell:

  ```
  sudo vim /etc/pam.d/chsh
  ```

  change: `auth required pam_shells.so` to
  `auth sufficient pam_shells.so`

  Now run: `chsh -s /usr/bin/fish`

- disable glob

  ```
  set -U fish_features qmark-noglob
  ```

### Node.JS

Install Node 12:

```
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -

sudo apt install -y nodejs
```

Install Yarn:

```
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -

echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update

sudo apt install yarn
```

Fix possible permissions errors:

```
sudo chmod 777 /usr/lib/node_modules
sudo chmod 777 /usr/bin
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
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

start vim and run `:PlugInstall`

### Golang

- download Go: https://golang.org/dl
- `sudo tar -C /usr/local -xzf /mnt/chromeos/MyFiles/Downloads/go1*.linux-amd64.tar.gz`
- create a Go workspace

  ```
    mkdir -p ~/go/bin
  mkdir -p ~/go-external/bin
  mkdir -p ~/go/src/github.com/Originate
  cd ~/go/src/github.com/Originate
  git clone git@github.com:Originate/git-town.git
  cd git-town
  make setup

  make build
  ```

Install Goland IDE:

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
curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash

sudo apt install git-lfs
```

### Java

```
sudo apt install openjdk-8-jdk
```

### Docker

```
sudo apt update
sudo apt install -y apt-transport-https ca-certificates curl gnupg2 software-properties-common

curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -

sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian stretch stable"

sudo apt update
sudo apt install -y docker-ce

sudo groupadd docker
sudo usermod -aG docker $USER
```

[complete instructions](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-debian-9)

### RipGrep

- https://github.com/BurntSushi/ripgrep#installation

### Time

```
sudo apt install -y time
```
