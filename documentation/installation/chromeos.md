## ChromeOS installation

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
sudo apt-get install fish
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
sudo apt-get install gcc g++ make
```

Install Yarn:

```
npm i -g yarn
```

- fix possible permissions errors:

    ```
    sudo chmod 777 /usr/lib/node_modules
    sudo chmod 777 /usr/bin
    ```


### VSCode

- download the DEB installer from the VSCode homepage
- move it to the Linux files
- `sudo apt-get install ./code_*.deb`


### Golang

- download Go: https://golang.org/dl
- move downloaded file to Linux files
- `tar -C /usr/local -xzf go*.linux-amd64.tar.gz`
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
