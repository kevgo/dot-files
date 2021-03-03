# Manjaro

### Chromium

```
sudo pacman -S chromium
```

log in to get auto-completion

To make Chromium the default browser, edit the `$BROWSER` variable in `.profile`
to point to `/usr/bin/chromium`

### Vim

```
sudo pacman -S nvim
```

### Rust

- https://rustup.rs

If it doesn't find `cc`:

```
sudo pacman -S gcc
```

### Go

```
sudo pacman -S go
```

### Fish shell

```
sudo pacman -S fish
chsh -s /usr/bin/fish fish
```

### Node.JS

```
sudo pacman -S nodejs yarn npm
```

### powersaver patch

```
sudo pacman -S tlp ethtool smartmontools
systemctl enable tlp
systemctl enable tlp-sleep.service
```

Verify installation:

```
sudo tlp stat
```

Go through everything and fix notices and warnings.

### external monitor brightness tool

check if the kernel extension is installed:

```
grep dev  /lib/modules/(uname -r)/modules.builtin
```

if the kernel extension is not installed, load it:

```
sudo nvim /etc/modules-load.d/modules.conf`
```

add `i2c_dev`

get the capability number for brightness:

```
ddcutil capabilities | grep Brightness
```

read the current screen brightness:

```
ddcutil getvcp 10
```

set the screen brightness:

```
ddcutil setvcp 10 70
```
