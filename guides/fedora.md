# Installation on Fedora-based systems

Install system updates: using the "Software" app.

Install NeoVim:

```
sudo dnf install neovim -y
```

Make "y" the default action in dnf: 

```
sudo nvim /etc/dnf/dnf.conf
```

Add `defaultyes=True` 

[source](https://www.reddit.com/r/Fedora/comments/rpttto/make_y_the_default_action_in_dnf)

### automatically boot into Fedora instead of Windows

- `/boot/efi/EFI/Boot/bootx64.efi` is the file that the computer boots from by
  default
- copy `/boot/efi/EFI/fedora/shim.efi` to this file to make the computer boot
  Fedora
- there should also be an identical file `/boot/efi/EFI/fedora/shimx64.efi`

### disable boot splash screen

Safe route:

- `plymouth-set-default-theme details`

Completely disable Plymouth

- edit `/etc/default/grub` and remove `rhgb quiet` from `GRUB_CMDLINE_LINUX`
- `sudo grub2-mkconfig -o /boot/efi/EFI/fedora/grub.cfg`

### Grub configuration

- `grub-customizer` sets default choices and delays but doesn't seem to work for
  customizing the layout
- create a larger font:
  `grub2-mkfont --output=/boot/efi/EFI/fedora/fonts/DejaVuSansMono48.pf2 --size=48 /usr/share/fonts/dejavu/DejaVuSansMono.ttf`
- make sure there is a new font file: `ls -la /boot/efi/EFI/fedora/fonts`
- make grub use the new font: `sudo nvim /etc/default/grub`

  ```
  GRUB_TERMINAL_OUTPUT="gfxterm"
  GRUB_FONT=/boot/efi/EFI/fedora/fonts/DejaVuSansMono48.pf2
  ```

- re-create Grub file after making config changes:
  `sudo grub2-mkconfig -o /boot/efi/EFI/fedora/grub.cfg`

### fractional scaling

It's enough to increase the font size, all apps respect this setting and
everything still looks sharp:

- open `gnome-tweaks`
- Fonts / Scaling Factor: 1.25

https://www.linuxuprising.com/2019/04/how-to-enable-hidpi-fractional-scaling.html

### GPU acceleration

Add the rpm-fusion nonfree repos:

```
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
```

Install the Intel drivers for video acceleration: Note: next time, try to
install the [intel-media-driver](https://github.com/intel/media-driver)
instead of the older [libva-intel-driver](https://github.com/intel/intel-vaapi-driver) 
because it supports AV1 which is used extensively on Youtube.
Additional info: https://docs.fedoraproject.org/en-US/quick-docs/assembly_installing-plugins-for-playing-movies-and-music/

```
sudo dnf install libva-intel-driver ffmpeg
```

```
sudo dnf groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
```

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

Play the video in VLC, it should show some activity in the `Video` section. Play
the video in Firefox, should be the same.

If it doesn't work in Firefox, enable hardware acceleration:

- go to `about:config`
- set `media.ffmpeg.vaapi.enabled`
- set `gfx.webrender.enabled`
- set `widget.wayland-dmabuf-vaapi.enabled`
- restart Firefox
- go to `about:support

### enable triple buffering

https://copr.fedorainfracloud.org/coprs/shrisha/gnome-shell-mutter-tripplebuffered-41/

### Stop airplane mode when opening the laptop

https://askubuntu.com/questions/965595/why-does-airplane-mode-keep-toggling-on-my-hp-laptop-in-ubuntu-18-04/965596#965596

### Gnome configuration

in `gnome-tweaks`:

- enable maximize button: Window Titlebars
- disable "activities" hot corner: Top Bar > Activities Overview Hot Corner
- Top Bar > Clock > Weekday
- disable the shutdown/restart confirmation dialogs:
  - `gsettings set org.gnome.SessionManager logout-prompt false`
  - if that doesn't work: `dconf-editor` > org > gnome > gnome-session > uncheck
    "logout-prompt"

Prevent screen lock:

- Settings > Privacy > Screen Lock

Change mouse cursor size:
- run `dconf-editor`
- navigate to `org/gnome/desktop/interface/cursor-size`
- change the setting from `default` to `16`

### clipboard access

This provides `wl-copy` and `wl-paste`:

```
sudo dnf install wl-clipboard
```

### Set up dotfiles

- [GitHub setup](github.md)
- [install dot-files](install-dotfiles.md)

### monitor brightness

```
sudo dnf install ddccontrol
```

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

### Sd

```
sudo dnf install sd
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

### Keyboard repeat rate

- Settings > Accessibility > Typing

### Chrome

enable Wayland mode:

- `sudo nvim /usr/share/applications/google-chrome.desktop`
- at the `Exec` key, add
  `-enable-features=UseOzonePlatform -ozone-platform=wayland`

### automatic dark mode at sunset

https://extensions.gnome.org/extension/2236/night-theme-switcher

### sound IO device chooser

https://extensions.gnome.org/extension/906/sound-output-device-chooser

### hide top bar

- https://extensions.gnome.org/extension/545/hide-top-bar

### Gnome terminal

- preferences > shortcuts > tabs

### customize look and feel

- enable
  [blur my shell](https://extensions.gnome.org/extension/3193/blur-my-shell)

### enable automatic updates

https://fedoraproject.org/wiki/AutoUpdates

### configure Firefox

[setup](firefox.md)

### improve tiling

https://extensions.gnome.org/extension/3733/tiling-assistant

### difftastic

https://github.com/Wilfred/difftastic
