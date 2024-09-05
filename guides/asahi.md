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

### Fish shell

```
sudo dnf install fish -y
```

#### Make Fn keys be Fn keys

```
sudo grubby --update-kernel=ALL --args="hid_apple.fnmode=2"
```

[source](https://discussion.fedoraproject.org/t/customize-f-keys-to-work-without-having-to-press-fn-f-keys/87408)

#### gnome tweaks

```
sudo dnf install gnome-tweaks
```

- Keyboard > Additional Layout Options > Caps Lock behavior > Make Caps Lock an additional Esc

### Node

```
sudo dnf install nodejs yarnpkg
```

```
yarn config set save-prefix ''
```
