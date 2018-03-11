# Manjaro i3 installation instructions

- start wifi dock icon in case it doesn't run

      nm-applet
      
- change desktop background

      nitrogen
      
- install Chromium

      sudo pacmac -S chromium
      
  change `.profile` to point to `/usr/bin/chromium`

- install powersaver patch

      sudo pacman -S tlp

- install Go

      sudo pacman -S go
      mkdir -p ~/d/go/bin
      mkdir -p ~/d/go-external/bin

- install tools

      sudo pacman -S the_silver_searcher prettier diff-so-fancy
      
- install fish

      sudo pacman -S fish
      chsh -s /usr/bin/fish

  log out and in again to see the change
