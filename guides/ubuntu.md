# Ubuntu Installation

### Set up dotfiles

- [GitHub setup](guides/../github.md)

```
git clone git@github.com:kevgo/dot-files.git ~/.config
~/.config/install
ln -s ~/.dot-files/bin_linux/ ~/bin_linux
```

### change Caps Lock key to ESC

- https://medium.com/@ahmaddynugroho/swap-caps-lock-and-escape-in-ubuntu-19-10-and-use-esc-easily-in-vim-vs-code-1d3d68f18764

### Neovim

- install build prerequisites:
  https://github.com/neovim/neovim/wiki/Building-Neovim#build-prerequisites

```
git clone git@github.com:neovim/neovim.git
git checkout stable
make CMAKE_BUILD_TYPE=Release
sudo make install
```

### Go

- download at https://golang.org/dl

### Git Town

```
git clone git@github.com:Originate/git-town.git
cd git-town
/usr/local/go/bin/go install
```

Set up the local API token to ship Git Town via the Github API from 1password.

### Fish

```
sudo apt install fish
```

start `fish` and fix all errors

```
chsh -s /usr/bin/fish
```

### Rust

- https://rustup.rs

### Node.js

- download at https://nodejs.org/en

```
tar -xJvf node-*.tar.xz
sudo mkdir -p /usr/local/lib/nodejs
sudo mv node-*/* /usr/local/lib/nodejs/
rm -rf node-*
```

### hardware drivers

```
sudo apt install acpi tlp
```

### Rust shell commands

```
cargo install --locked bat
cargo install --locked ripgrep
```
