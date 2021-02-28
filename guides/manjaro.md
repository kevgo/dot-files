### Go

```
sudo pacman -S go
```

### Fish shell

```
sudo pacman -S fish chsh -s /usr/bin/fish fish
```

### Chromium

    sudo pacmac -S chromium

To make Chromium the default browser, edit the `$BROWSER` variable in `.profile`
to point to `/usr/bin/chromium`

### powersaver patch

    sudo pacman -S tlp ethtool smartmontools
    systemctl enable tlp
    systemctl enable tlp-sleep.service

Verify installation:

    sudo tlp stat

Go through everything and fix notices and warnings.

### Node.JS

    sudo pacman -S nodejs yarn npm
