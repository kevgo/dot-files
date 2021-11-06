# Installation on Fedora-based systems

This installation does the most risky things first.

Uninstall pointless packages:

```
sudo dnf remove gnome-shell-extension-applications-menu gnome-shell-extension-window-list
```

Install system updates: using the "Software" app

### Automatically boot into Fedora instead of Windows

- `/boot/efi/EFI/Boot/bootx64.efi` is the file that the computer boots from by default
- copy `/boot/efi/EFI/fedora/shim.efi` to this file to make the computer boot Fedora
- there should also be an identical file `/boot/efi/EFI/fedora/shimx64.efi`

### Grub configuration

- `grub-customizer`
- re-create Grub file after making config changes: `sudo grub2-mkconfig -o /boot/efi/EFI/fedora/grub.cfg`

### fractional scaling

https://www.linuxuprising.com/2019/04/how-to-enable-hidpi-fractional-scaling.html

### GPU acceleration

```
sudo dnf install intel-media-driver intel-gpu-tools libva libva-utils
```

See hardware-supported codecs:

```
vainfo
```

Download a video in the supported codec:

```
youtube-dl -f 248+251 <video>
```

Check whether hardware support works:

```
sudo intel_gpu_top
```

Play the video in VLC, it should show some activity in the `Video` section.
Play the video in Firefox, should be the same.

If it doesn't work in Firefox, enable hardware acceleration:

- go to `about:config`
- set `media.ffmpeg.vaapi.enabled`
- set `gfx.webrender.enabled`
- set `widget.wayland-dmabuf-vaapi.enabled`
- restart Firefox
- go to `about:support

### Stop airplane mode when opening the laptop

https://askubuntu.com/questions/965595/why-does-airplane-mode-keep-toggling-on-my-hp-laptop-in-ubuntu-18-04/965596#965596

### Gnome configuration

in `gnome-tweaks`:

- enable maximize button: Window Titlebars
- disable "activities" hot corner: Top Bar > Activities Overview Hot Corner
- Top Bar > Clock > Weekday

- show SystemD output during startup: `plymouth-set-default-theme details --rebuild-initrd`
- disable the shutdown/restart confirmation dialogs:
  - `gsettings set org.gnome.SessionManager logout-prompt false`
  - if that doesn't work: `dconf-editor` > org > gnome > gnome-session > uncheck "logout-prompt"

### clipboard access

This provides `wl-copy` and `wl-paste`:

```
sudo dnf install wl-clipboard
```

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

### Vim

```
nvim
```

[Vim installation](vim_installation.md)

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

### Postgres

https://developer.fedoraproject.org/tech/database/postgresql/about.html

### Java

https://docs.fedoraproject.org/en-US/quick-docs/installing-java

### Docker

https://developer.fedoraproject.org/tools/docker/docker-installation.html

### Chrome

enable Wayland mode:

- `sudo nvim /usr/share/applications/google-chrome.desktop`
- at the `Exec` key, add
  `-enable-features=UseOzonePlatform -ozone-platform=wayland`

### automatic dark mode at sunset

https://extensions.gnome.org/extension/2236/night-theme-switcher

### sound IO device chooser

https://extensions.gnome.org/extension/906/sound-output-device-chooser

### Gnome terminal

- preferences > shortcuts > tabs

### customize look and feel

- enable [blur my shell](https://extensions.gnome.org/extension/3193/blur-my-shell)

### enable automatic updates

https://fedoraproject.org/wiki/AutoUpdates

### configure Firefox

- https://wiki.archlinux.org/title/Firefox/Tweaks
- disable pocket
- move disk cache to RAM
