## ChromeOS installation

### Backup old machine

- Quick Write snippets
- downloaded files
- uncommitted files in code bases

### Settings

- Manage other people > disable guest and restrict login
- Linux: enable

Chrome settings:

- chrome://flags/#scheduler-configuration
- chrome://flags/#quiet-notification-prompts
- chrome://flags/#enable-tab-search (disable)
- chrome://flags/#enable-virtual-desks-gestures
- chrome://flags/#enable-reader-mode
- chrome://flags/#webui-tab-strip
- chrome://flags/#ash-limit-alt-tab-to-active-desk
- chrome://flags/#impulse-scroll-animations
- chrome://flags/#ash-limit-shelf-items-to-active-desk
- chrome://flags/#enhanced_clipboard
- chrome://flags/#percent-based-scrolling

### Folder sharing

- right click on `Downloads` folder, choose `Share with Linux`
- right click on `MyDrive` folder in Google Drive, choose `Share with Linux`

### Set up dotfiles

- [GitHub setup](github.md)
- [install dot-files](install-dotfiles.md)

```
ln -s ~/.dot-files/bin_chromeos/ ~/bin_chromeos
```

### update base system

```
sudo apt update
sudo apt upgrade
```

### Compilers

Install `make` and the compilers needed for the C extensions of
Node.JS:

```
sudo apt install -y build-essential
```

### Fish shell

This needs to come first so that we can run the remaining commands in fish,
where the correct paths are set.

```
/home/linuxbrew/.linuxbrew/bin/brew install fish
```

- `sudo vim /etc/shells` add `/home/linuxbrew/.linuxbrew/bin/fish`
- set fish as default shell:

  ```
  sudo vim /etc/pam.d/chsh
  ```

  change: `auth required pam_shells.so` to `auth sufficient pam_shells.so`

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

### Rust

- https://www.rust-lang.org/tools/install

```
cargo install git-delta
```

### Git

```
brew install git
```

To sign commits:

- import the key for signing commits:
  `gpg --import ~/.dot-files-private/private.pgp`

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
- do the
  [VSCode setup](https://github.com/kevgo/dot-files/blob/master/guides/vscode.md)
- open the Git Town repo in VSCode and have it install the Go tools
- if you need GCC in a particular version: `brew install gcc@5`

### Docker

- this one works:
  https://dvillalobos.github.io/2020/How-to-install-and-run-Docker-on-a-Chromebook
- alternative: https://docs.docker.com/engine/install/debian/

### RipGrep

```
brew install ripgrep
```

### Time

```
brew install gnu-time
```

### Music

- optionally copy music files from backup disc into a `Music` folder in
  `My Files`
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
