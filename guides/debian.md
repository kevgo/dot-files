# Installation of Debian-based systems

### update base system

```
sudo apt update
sudo apt -y upgrade
```

### Compilers

Install `make` and the compilers needed (on developer laptops):

```
sudo apt install -y build-essential
```

### Fish shell

This needs to come first so that we can run the remaining commands in fish,
where the correct paths are set.

```
sudo apt install fish
```

set fish as default shell:

```
sudo vim /etc/pam.d/chsh
```

change: `auth required pam_shells.so` to `auth sufficient pam_shells.so`

```
chsh -s /usr/bin/fish
```

open a new terminal window

```
set -U fish_features qmark-noglob
```

### Node.JS

```
curl -sL https://deb.nodesource.com/setup_15.x | sudo bash -
sudo apt-get install -y nodejs
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update && sudo apt-get install yarn
yarn config set save-prefix ''
```

### Rust

- https://www.rust-lang.org/tools/install

```
cargo install git-delta
```

### Git

Git-LFS:

```
sudo apt install git-lfs
```

Delta:

Download the `x86_64-unknown-linux-gnu.tar.gz` file at https://github.com/dandavison/delta/releases/latest

```
tar xf <file>
sudo cp <subfolder>/delta /usr/local/bin
```

### Vim

To use the built-in Neovim:

```
sudo apt install -y neovim
```

or [build from source](https://github.com/neovim/neovim/wiki/Installing-Neovim#install-from-source).

```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

- start nvim and run `:PlugInstall`
- install prettier globally:

  ```
  sudo npm install -g prettier --unsafe-perm=true
  ```

### Go

- download installer at https://golang.org/dl

### Git Town

Stand-alone install: https://github.com/git-town/git-town/releases/latest

```
sudo apt install /mnt/chromeos/MyFiles/Downloads/git-town*.deb
```

Manual install:

```
git clone git@github.com:git-town/git-town.git
cd git-town
make setup

make test
```

- if you need `gcc-5`: `brew install gcc@5`
- if Python is not found: `sudo apt install python`

### VSCode

- [VSCode setup](vscode.md)

Not on the tiny Chromebook:

```
ln -s ~/.dot-files/bin_chromeos/ ~/bin_chromeos
```

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
sudo apt install time
```

### Java

```
brew install openjdk
```

### Firefox

```
sudo apt install firefox-esr
```
