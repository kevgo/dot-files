# Manjaro i3 installation

#### configure HiDPI screen settings

- edit `~/.Xresources` to contain:

  ```
  Xft.dpi: 220
  ```

- reboot

#### pacman colors

uncomment the `Color` line in `/etc/pacman.conf`

#### termine

    sudo pacman -S termite

#### natural scrolling

```
sudo vim /usr/share/X11/xorg.conf.d/40-libinput.conf
```

add to the `touchpad` section:

```
Option  "NaturalScrolling" "True"
```

#### clone the config repo

    mv ~/.config ~/.config_old
    git clone git@github.com:kevgo/dot-files.git ~/.config
    mv ~/.config_old/*.* ~/.config
    mv ~/.config_old/* ~/.config

Review the changes and commit any updates made by the Manjaro team.

#### change desktop background

    nitrogen

#### change GTK theme

    gtk-chtheme

#### change GTK+ theme and mouse cursor

    lxappearance

#### Chromium

    sudo pacmac -S chromium

To make Chromium the default browser,
edit the `$BROWSER` variable in `.profile` to point to `/usr/bin/chromium`

#### powersaver patch

    sudo pacman -S tlp ethtool smartmontools
    systemctl enable tlp
    systemctl enable tlp-sleep.service

When installing on Lenovo hardware:

sudo pacman -S acpi_call

Verify installation:

    sudo tlp stat

Go through everything and fix notices and warnings.

#### Go

      sudo pacman -S go
      mkdir -p ~/d/go/bin
      mkdir -p ~/d/go-external/bin

#### Node.JS

    sudo pacman -S nodejs yarn npm

#### misc tools

    sudo pacman -S the_silver_searcher diff-so-fancy shellcheck

#### Fish shell

    sudo pacman -S fish
    chsh -s /usr/bin/fish
    fish   # fix errors

log out and in again to see the change

#### Vim

    sudo pacman -S cmake npm
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    vim +PlugInstall
    compile_youcompleteme
    vim +GoInstallBinaries

#### Vint

    sudo pacman -S python-pip
    sudo pip install vim-vint

#### Alt-Tab hotkey

    go get github.com/s-urbaniak/i3-focus-last

## AUR packages

#### Slack

These instructions seem weird. Are there better ones?

    yaourt -S slack-desktop

#### Github Desktop

    yaourt -S github-desktop

#### Zoom

    yaourt -S zoom

## Fine tuning

### disable ahavi

```
ln -s /dev/null /etc/systemd/system/avahi-daemon.service
ln -s /dev/null /etc/systemd/system/avahi-daemon.socket
ln -s /dev/null /etc/systemd/system/dbus-org.freedesktop.Avahi.service
```
