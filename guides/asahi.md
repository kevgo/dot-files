# Asahi Linux installation

Installer: https://fedora-asahi-remix.org

#### Set Dvorak keyboard layout in login screen

```
localectl set-keymap dvorak
```

#### Only charge the battery to 80% ([source](https://social.treehouse.systems/@AsahiLinux/110560192550506827):

```
echo 'SUBSYSTEM=="power_supply", KERNEL=="macsmc-battery", ATTR{charge_control_end_threshold}="80"' | sudo tee /etc/udev/rules.d/10-battery.rules
```

The changes take effect after the next reboot.

#### Software app

- install Console
- install all updates

#### Install NeoVim:

```
sudo dnf install neovim -y
```

#### Make "y" the default action in dnf: 

```
sudo nvim /etc/dnf/dnf.conf
```

Add `defaultyes=True` 

[source](https://www.reddit.com/r/Fedora/comments/rpttto/make_y_the_default_action_in_dnf)

### dot-files

- [GitHub SSH setup](https://github.com/kevgo/dot-files/blob/main/guides/github.md)
- [install dot files](https://github.com/kevgo/dot-files/blob/main/guides/install-dotfiles.md)
- now you can finish the [Vim installation](vim_installation.md)

#### Make Fn keys be Fn keys

```
sudo grubby --update-kernel=ALL --args="hid_apple.fnmode=2"
```

[source](https://discussion.fedoraproject.org/t/customize-f-keys-to-work-without-having-to-press-fn-f-keys/87408)

#### enable the screen space around the notch

```
sudo grubby --update-kernel=ALL --args=apple_dcp.show_notch=1
```

#### gnome tweaks

```
sudo dnf install gnome-tweaks -y
```

- Keyboard > Additional Layout Options > Caps Lock behavior > Make Caps Lock an additional Esc

#### disable the shutdown/restart confirmation dialogs

`dconf-editor` > org > gnome > gnome-session > uncheck "logout-prompt"

#### display the day of week in the top bar

`dconf-editor` > search for "weekday" > enable

#### change mouse cursor size

- run `dconf-editor`
- navigate to `org/gnome/desktop/interface/cursor-size`
- change the setting from default to `16`

### Go

```
sudo dnf install golang -y
```

### Git Town

```
git clone git@github.com:git-town/git-town.git
```

```
cd git-town
```

```
make install
```

### Fish shell

```
sudo dnf install fish -y
```

### Rust

https://rustup.rs

### Node

```
sudo dnf install nodejs yarnpkg -y
```

```
yarn config set save-prefix ''
```

### VS Code

https://code.visualstudio.com/docs/setup/linux#_rhel-fedora-and-centos-based-distributions

### ripgrep

```
sudo dnf install ripgrep -y
```

### bat

```
sudo dnf install bat -y
```
