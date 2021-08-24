# Installation of Debian-based systems

### update base system

```
sudo apt update && sudo apt -y upgrade
```

### Set up dotfiles

- [GitHub setup](github.md)
- [install dot-files](install-dotfiles.md)

We'll install the `bin_chromeos` symlink later because it interferes with
loading VSCode extensions.

### Compilers

Install `make` and the compilers needed (on developer laptops):

```
sudo apt install -y build-essential
```

### Fish shell

This needs to come first so that we can run the remaining commands in fish,
where the correct paths are set.

```
sudo apt install -y fish
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
```

```
sudo apt-get install -y nodejs
```

```
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
```

```
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
```

```
sudo apt-get update && sudo apt-get install yarn
```

```
yarn config set save-prefix ''
```

### Rust

- https://rustup.rs

```
rustup default nightly
```

### Git

The built-in Git is really old and doesn't work when deploying Prettifier.
Remove the built-in Git:

```
sudo apt remove git
sudo apt autoremove
```

[Compile from source](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)

Add `subtree` command:

```
cd git/contrib/subtree
make
sudo make prefix=/usr install
```

Git-LFS:

```
sudo apt install git-lfs
```

Delta:

```
cargo install git-delta
```

or manually: download the `x86_64-unknown-linux-gnu.tar.gz` file at
https://github.com/dandavison/delta/releases/latest

```
tar xf <file>
sudo cp <subfolder>/delta /usr/local/bin
```

### Vim

download the [latest release](https://github.com/neovim/neovim/releases/latest) and install manually:

```
cd /mnt/chromeos/MyFiles/Downloads
tar -xvf nvim-linux64.tar.gz
cd nvim-linux64
find . -type d -exec sudo mkdir -p '/usr/local/{}' \;

find . -type f -exec sudo mv '{}' '/usr/local/{}' \;
```

optionally to verify : `find . -type d -empty -delete`


To use the built-in Neovim (which is severely outdated):

```
sudo apt install -y neovim
```

or to build from source:

install build prerequisites:
https://github.com/neovim/neovim/wiki/Building-Neovim#build-prerequisites

```
git clone git@github.com:neovim/neovim.git
git checkout stable
make CMAKE_BUILD_TYPE=Release
sudo make install
```

[Vim installation](vim_installation.md)

### Go

- download installer at https://golang.org/dl

```
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf <FILE>
```

### Git Town

Stand-alone install: https://github.com/git-town/git-town/releases/latest

```
sudo apt install git-town*.deb
```

Manual install:

```
git clone git@github.com:git-town/git-town.git
```

```
cd git-town
make build
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
cargo install --locked ripgrep
```

or

```
sudo apt-get install ripgrep
```

### Bat

```
cargo install --locked bat
```

or

```
sudo apt install bat
```

or

download the installer at https://github.com/sharkdp/bat/releases/latest

```
sudo apt install -y /mnt/chromeos/MyFiles/Downloads/bat*.deb
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
sudo apt install -y firefox-esr
```
