# Manjaro i3 installation instructions

- install lxterminal

      sudo pacman -S lxterminal
      
- start wifi dock icon in case it doesn't run

      nm-applet
      
- change desktop background

      nitrogen
      
- change GTK theme

      gtk-chtheme
      
- change GTK+ theme and mouse cursor

      lxappearance

- install Chromium

      sudo pacmac -S chromium
      
  to make Chromium the default browser,
  edit the `$BROWSER` variable in `.profile` to point to `/usr/bin/chromium`

- install powersaver patch
    
    ```
    sudo pacman -S tlp ethtool smartmontools
    systemctl enable tlp
    systemctl enable tlp-sleep.service
    ```
    
    When installing on Lenovo hardware:
    
    ```
    sudo pacman -S acpi_call
    ```
    
    Verify installation:
    
    ```
    sudo tlp stat
    ```
    
    Go through everything and fix notices and warnings.

- install Go

      sudo pacman -S go
      mkdir -p ~/d/go/bin
      mkdir -p ~/d/go-external/bin

- install Node

      sudo pacman -S nodejs yarn npm

- install tools

      sudo pacman -S the_silver_searcher prettier diff-so-fancy shellcheck
      
- install fish

      sudo pacman -S fish
      chsh -s /usr/bin/fish

  log out and in again to see the change

- install Vim

      sudo pacman -S cmake npm 
      git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
      ~/.fzf/install
      curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
      vim +PlugInstall
      compile_youcompleteme
      vim +GoInstallBinaries
      
- install Vint

      sudo pacman -S python-pip
      sudo pip install vim-vint
 
- install Slack
  
  These instructions seem weird. Are there better ones?

      mkdir ~/tmp
      cd ~/tmp
      sudo pacman -S libcurl-compat
      git clone https://aur.archlinux.org/slack-desktop.git
      makepkg
      sudo pacman -U *.pkg.tar.xz

- install the Alt-Tab hotkey

      go get github.com/s-urbaniak/i3-focus-last
