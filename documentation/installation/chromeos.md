## ChromeOS installation

### Backup old machine

- Quick Write snippets

### Settings

- Wifi connection: enable Google DNS
- Screen lock > PIN or password
- Manage other people > disable guest and restrict login
- Wallpaper
- Keyboard
  - Caps Lock: change to `Escape`
  - set delay and repeat rate
- Displays > Display Size
- Linux: enable

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
- clone the dotfiles: `git clone git@github.com:kevgo/dot-files.git .config`
- install the symlinks: `.config/install/install.sh`

### Fish shell

```
sudo apt install -y fish
```

- start fish and fix error messages
- set fish as default shell:

  ```
  sudo vim /etc/pam.d/chsh
  ```

  change: `auth required pam_shells.so`
  to
  `auth sufficient pam_shells.so`

  Now run: `chsh -s /usr/bin/fish`

- disable glob
  ```
  set -U fish_features qmark-noglob
  ```

### Node.JS

Install dependencies:

```
sudo apt update
sudo apt install -y curl gnupg
```

Install Node 10:

```
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
sudo apt install -y nodejs
```

Install compiler tools for native extensions:

```
sudo apt install -y gcc g++ make
```

[Install Yarn](https://yarnpkg.com/en/docs/install#debian-stable)

- fix possible permissions errors:

  ```
  sudo chmod 777 /usr/lib/node_modules
  sudo chmod 777 /usr/bin
  ```

Install diff-so-fancy:

```
npm i -g diff-so-fancy
```

### VSCode

- download the DEB installer from the VSCode homepage
- move it to the Linux files
- `sudo apt install -y ./code_*.deb`

### Vim

```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

start vim and run `:PlugInstall`

### Golang

- download Go: https://golang.org/dl
- move downloaded file to Linux files
- `sudo tar -C /usr/local -xzf go*.linux-amd64.tar.gz`
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

### Git-LFS

```
curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash
sudo apt install git-lfs
```

### Java

```
sudo apt install openjdk-8-jdk
```

### Make

install `column` utility needed for `make help`:

```
sudo apt install bsdmainutils
```

### Docker

```
sudo apt update
sudo apt install apt-transport-https ca-certificates curl gnupg2 software-properties-common
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian stretch stable"
sudo apt update
sudo apt install docker-ce
sudo groupadd docker
sudo usermod -aG docker $USER
```

[complete instructions](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-debian-9)

### RipGrep

- https://github.com/BurntSushi/ripgrep#installation
