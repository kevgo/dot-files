# Manjaro KDE installation instructions

### initial configuration to get going

Adjust to 4k display

- set screen zoom level: system settings > Display and Monitor > Global scale
- set tray icon zoom level: add `export PLASMA_USE_QT_SCALING=1` to
  `.bash_profile` and reboot

### clone dot files

This should happen early because any configuration change you try out will be
lost after we do this.

```
git clone git@github.com:kevgo/dot-files.git .dot-files

.dot-files/install
```

### configure KDE

- remove window titlebars:
  https://medium.com/@CodyReichert/how-to-hide-title-bars-in-kde-plasma-5-348e0df4087f

### fish

```
sudo pacman -S fish
```

### go

```
sudo pacman -S go
```

### node

```
sudo pacman -S nodejs
```

### vim

```
sudo pacman -S neovim
```

### make

```
pacman -S make
```

### git town

```
git clone git@github.com:git-town/git-town.git
cd git-town
make install
```

### final touches

- import the key for signing commits:
  `gpg --import ~/.dot-files-private/private.pgp`
- if Chromium complains that it isn't the default browser:
  https://forum.manjaro.org/t/each-time-i-open-chromium-it-tells-me-it-isnt-my-default-browser/26680
- reduce tearing when scrolling:
  `system settings > Display and monitor > Compositor > Tearing prevention: Full-screen repaints`
