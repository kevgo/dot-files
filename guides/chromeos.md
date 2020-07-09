## ChromeOS installation

### Backup old machine

- Quick Write snippets
- downloaded files
- uncommitted files in code bases

### Settings

- Wifi connection: enable Google DNS
- Screen lock > PIN or password
- Manage other people > disable guest and restrict login
- Keyboard
  - Caps Lock: change to `Escape`
  - set delay and repeat rate
- Displays > Display Size
- Linux: enable

Chrome settings:

- chrome://flags/#scheduler-configuration, set to `performance`
- chrome://flags/#quiet-notification-prompts
- chrome://flags/#enable-virtual-desks-gestures
- chrome://flags/#enable-reader-mode
- chrome://flags/#webui-tab-strip
- chrome://flags/#ash-limit-alt-tab-to-active-desk

### Folder sharing

- right click on `Downloads` folder, choose `Share with Linux`
- right click on `MyDrive` folder in Google Drive, choose `Share with Linux`

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
- don't create a GPG key, we'll import the existing one later
- clone the dotfiles:

      rm -rf .config
      git clone git@github.com:kevgo/dot-files.git .dot-files
      .dot-files/install

### Build tools

This installs `make` and the compilers needed for Homebrew and the C extensions of Node.JS:

```
sudo apt update
sudo apt install -y build-essential
```

### Homebrew

https://docs.brew.sh/Homebrew-on-Linux

### Fish shell

This needs to come first so that we can run the remaining commands in fish, where the correct paths are set.

```
/home/linuxbrew/.linuxbrew/bin/brew install fish
```

- `sudo vim /etc/shells` add `/home/linuxbrew/.linuxbrew/bin/fish`
- set fish as default shell:

  ```
  sudo vim /etc/pam.d/chsh
  ```

  change: `auth required pam_shells.so` to
  `auth sufficient pam_shells.so`

  Now run: `chsh -s /home/linuxbrew/.linuxbrew/bin/fish`

- open a new terminal window
- disable glob

  ```
  set -U fish_features qmark-noglob
  ```

### Node.JS

```
brew install node

npm i -g yarn

yarn config set save-prefix ''
```

### Git

```
brew install git

npm i -g diff-so-fancy
```

To sign commits:

- import the private key from Google Drive: `gpg --import /mnt/chromeos/GoogleDrive/MyDrive/Documents/Legal/github-signing-secret-key.asc`

Git-LFS:

```
brew install git-lfs
```

### Vim

```
brew install nvim

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

- start nvim and run `:PlugInstall`
- install prettier globally: `npm i -g prettier`

### Go

```
brew install go
```

### Git Town

```
git clone git@github.com:git-town/git-town.git
cd git-town
make setup

make test
```

- if you need `gcc-5`: `brew install gcc@5`
- if Python is not found: `sudo apt install python`

### VSCode

- [download the DEB installer](https://code.visualstudio.com/download)
- `sudo apt install -y /mnt/chromeos/MyFiles/Downloads/code_*.deb`
- do the [VSCode setup](https://github.com/kevgo/dot-files/blob/master/guides/vscode.md)
- open the Git Town repo in VSCode and have it install the Go tools
- if you need GCC in a particular version: `brew install gcc@5`

### Docker

https://docs.docker.com/engine/install/debian/

### RipGrep

```
brew install ripgrep
```

### Time

```
brew install gnu-time
```

### Music

- optionally copy music files from backup disc into a `Music` folder in `My Files`
- `brew install rclone`
- share the `Music` folder with Linux
- run `music-down-execute` to get the latest changes from GDrive

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

### Firefox

```
sudo apt install firefox-esr
```
