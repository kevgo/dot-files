# Manjaro KDE installation instructions

### adjust to 4k display

- set screen zoom level: system settings > Display and Monitor > Global scale
- set tray icon zoom level: add `export PLASMA_USE_QT_SCALING=1` to `.bash_profile`

### configure KDE

- remove window titlebars: https://medium.com/@CodyReichert/how-to-hide-title-bars-in-kde-plasma-5-348e0df4087f

### fish

```
sudo pacman -S fish
```

### chrome

```
sudo pacman -S chromium
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
