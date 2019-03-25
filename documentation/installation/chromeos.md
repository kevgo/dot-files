## ChromeOS installation

ChromiumOS problems:
- play video on Amazon (missing DRM component)
- plugging in the headphones creates buzzing background noise and distorted sound
- after sleep, full-screen videos stutter unless the mouse moves
- very infrequent updates
- hotkey for overview mode (Fn-F5) requires pressing the Fn key 
- Google Drive doesn't work
- chrome://flags doesn't work
- battery runtime is only 4 hours
- Cog doesn't display temperatures

CloudReady:
- chrome://flags works
- Amazon video works
- headphones work
- Google Drive works
- PIN login doesn't work

### Install ChromiumOS on HDD

- boot from USB stick
- `Ctrl+Alt+T` to open a terminal with crosh
- run `shell` to go into Bash
- run `lsblk` to see all available block storage devices
- run `/usr/sbin/chromeos-install --dst <device>`

### Install CloudReady on external SSD drive
- create normal USB installer stick and boot from it
- log into ChromeOS
- hit `Ctrl+Alt+T` to open a terminal with crosh
- run `shell` to go into Bash
- determine the name of the external SSD drive
   - `sudo fdisk -l`
   - when unsure, remove the drive and see which drive is missing
- `cd /usr/sbin`
- `sudo chromeos-install --dst /dev/sdX`  (replace `X` with your drive)
- turn off the machine: `sudo poweroff`


### Linux

- enable Google DNS
   - Settings > Network
- install Linux
   - Setting > Linux


### Settings

- Screen lock > PIN or password
- Manage other people > disable guest and restrict login
- Wallpaper
- Keyboard
  - Caps Lock: change to `Escape`
  - set delay and repeat rate
- Displays > Display Size

### Set up dotfiles

- generate SSH key:
  
  ```
  ssh-keygen -t rsa -b 4096 -C "kevin.goslar@gmail.com"
  eval "$(ssh-agent -s)"
  ssh-add ~/.ssh/id_rsa
  sudo apt-get install xclip
  xclip -sel clip < ~/.ssh/id_rsa.pub
  ```
- register SSH key with GitHub: https://github.com/settings/keys
- clone the dotfiles: `git clone git@github.com:kevgo/dot-files.git .config`
- install the symlinks: `.config/install/install.sh`

### Fish shell

```
sudo apt-get install -y fish
```

- start fish and fix error messages
- set fish as default shell:
  ```
  sudo vim /etc/pam.d/chsh
  ```
  
  change: `auth       required   pam_shells.so`
  to
  `auth       sufficient   pam_shells.so`
  
  Now run: `chsh -s /usr/bin/fish`
- disable glob
  ```
  set -U fish_features qmark-noglob
  ```

### Node.JS

Install dependencies:

```
sudo apt-get update
sudo apt-get install -y curl gnupg
```

Install Node 10:

```
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
sudo apt-get install -y nodejs
```

Install compiler tools for native extensions:

```
sudo apt-get install -y gcc g++ make
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
- `sudo apt-get install ./code_*.deb`


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
sudo apt-get install git-lfs
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
