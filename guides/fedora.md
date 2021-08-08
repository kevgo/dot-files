# Installation on Fedora-based systems

- install system updates: using the "Software" app

### Set up dotfiles

- [GitHub setup](github.md)
- [install dot-files](install-dotfiles.md)

### Configuration

swap Caps lock and ESC:

- run `gnome-tweaks`
- Keyboard & Mouse > Additional Layout Options
- Caps Lock behavior

open terminal with [ctrl]-[alt]-T:

- system settings > keyboard > customize shortcuts
- Custom Shortcuts
- app name: `gnome-terminal`, shortcut: `ctrl-alt-T`

limit alt-tab to current desktop:

```
gsettings set org.gnome.shell.app-switcher current-workspace-only true
```

[Stop airplane mode when opening the laptop](https://askubuntu.com/questions/965595/why-does-airplane-mode-keep-toggling-on-my-hp-laptop-in-ubuntu-18-04/965596#965596)

### Vim

```
nvim
```

### Git

```
git-lfs
git-delta
```

### Fish shell

- run `fish`
- run again to start fish?
- `chsh -s $(which fish)`

### Node

```
sudo dnf install nodejs yarnpkg

yarn config set save-prefix ''
```

### Rust

- https://rustup.rs (custom installation, install `stable`)

### Go

```
sudo dnf install golang
```

### VS Code

https://code.visualstudio.com/docs/setup/linux#_rhel-fedora-and-centos-based-distributions

### RipGrep

```
sudo dnf install ripgrep
```

### Bat

```
sudo dnf install bat
```

### Firefox

change scroll distance:

- go to `about:config`
- search for `toolkit.scrollbox.verticalScrollDistance`
- set to 15

install https://addons.mozilla.org/en-US/firefox/addon/ublock-origin

try out https://github.com/wilfredwee/photon-australis

### Postgres

https://developer.fedoraproject.org/tech/database/postgresql/about.html

### Java

https://docs.fedoraproject.org/en-US/quick-docs/installing-java

### Docker

https://developer.fedoraproject.org/tools/docker/docker-installation.html

### Chrome

enable Wayland mode:

- `sudo nvim /usr/share/applications/google-chrome.desktop`
- at the `Exec` key, add `-enable-features=UseOzonePlatform -ozone-platform=wayland`

### CPU scaling

enable better framerate (battery cost): https://extensions.gnome.org/extension/1082/cpufreq

More info: https://ask.fedoraproject.org/t/how-to-increasing-performance-by-changing-cpu-governor-and-reducing-swappiness/10006
