## Installation Instructions for Windows

### Install Windows

1. hit `F11` during startup to boot into recovery mode
1. reset this PC
1. create user account "kevlar"
1. install Windows updates
1. install Chrome and log into Github

### Install command-line

3. [Cygwin](https://www.cygwin.com)
    - move the setup file to a new folder `~\cygwin-setup` before running it and keep it there
    - add fish
    - add git
    - add make
    - add vim
    - configure terminal to use `xterm256` emulation
1. Git (already installed via Cygwin)
    - [create SSH key](https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent): 
      - `ssh-keygen -t rsa -b 4096 -C "kevin.goslar@gmail.com" -P ""`
      - if the command hangs, provide the password via `-P ""`
      - if `ssh-agent` doesn't start, run `Set-Service ssh-agent -StartupType Manual` in admin PowerShell
    - [add SSH key to Github](https://help.github.com/articles/adding-a-new-ssh-key-to-your-github-account)
    - make SSH key available in Windows CMD by copying `c:\cygwin64\home\kevlar\.ssh` to `c:\Users\kevlar\.ssh`
    - optionally fix permissions on `c:\Users\kevlar\.ssh\id_rsa` to only be visible to your user account (remove everybody else):
      - right-click in Explorer > Properties > Security 
1. [Node](https://nodejs.org/en/download)
    - install via Windows installer
    - Yarn: `npm i -g yarn`
1. [Go](https://golang.org/dl)
    - install via Windows installer
    - `mkdir -p go/src/github.com/Originate`
    - create a soft link `c:\Users\kevlar\go --> c:\cygwin64\home\kevlar\go` in the Windows CMD:
        ```
        cd \Users\kevlar\go
        mklink /D go c:\cygwin64\home\kevlar\go`
        ```
1. [Git Town](https://github.com/Originate/git-town)
    - install aliases: `git town alias true`
1. diff-so-fancy

    ```
    npm i -g diff-so-fancy
    git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
    ```
1. [VSCode](../vscode/README.md)
1. [Firefox](https://www.mozilla.org/en-US/firefox/new)
1. Slack via Windows Store


### Install Home directory

1. `git clone git@github.com:kevgo/dot-files.git .config`
1. `.config/install/install.sh`

### Install Windows Cmd shortcuts

```
mkdir bin
cd bin
echo @git branch %* > br.cmd
echo @cd %HOMEPATH% > "cd~.cmd"
echo @git checkout %* > co.cmd
echo @cd c:\cygwin64\home\kevlar\d > d.cmd
echo @git add -A > gac.cmd
echo @git commit -m "%*" >> gac.cmd
echo @git add -A > gacp.cmd
echo @git commit -m "%*" >> gacp.cmd
echo @git push >> gacp.cmd
echo @git town continue > gc.cmd
echo @git diff > gd.cmd
echo @git diff master > gdm.cmd
echo @git new-pull-request > gpr.cmd
echo @git push > gp.cmd
echo @git sync > gs.cmd
echo @cd go\src\github.com\Originate\git-town > gt.cmd
echo @ls -1 > l.cmd
echo @git status > st.cmd
echo @c:\Users\kevlar\cygwin-setup\setup-x86_64.exe --no-desktop --no-shortcuts --no-startmenu --quiet-mode  > update-cygwin.cmd
cd ..
```

### Remove preinstalled apps

in PowerShell

```
Get-AppxPackage *3DBuilder* | Remove-AppxPackage
Get-AppxPackage *Getstarted* | Remove-AppxPackage
Get-AppxPackage *WindowsAlarms* | Remove-AppxPackage
Get-AppxPackage *bing* | Remove-AppxPackage
Get-AppxPackage *SkypeApp* | Remove-AppxPackage
Get-AppxPackage *solit* | Remove-AppxPackage
Get-AppxPackage *windowscommunicationsapps* | Remove-AppxPackage
Get-AppxPackage *zune* | Remove-AppxPackage
Get-AppxPackage *Sway* | Remove-AppxPackage
Get-AppxPackage *CommsPhone* | Remove-AppxPackage
Get-AppxPackage *ConnectivityStore* | Remove-AppxPackage
Get-AppxPackage *Microsoft.Messaging* | Remove-AppxPackage
Get-AppxPackage *Facebook* | Remove-AppxPackage
Get-AppxPackage *Twitter* | Remove-AppxPackage
Get-AppxPackage *Drawboard PDF* | Remove-AppxPackage
Get-AppxPackage Soda | Remove-AppxPackage
Get-AppxPackage Microsoft.XboxApp | Remove-AppxPackage
Get-AppxPackage Microsoft.XboxIdentityProvider | Remove-AppxPackage
Get-AppxPackage *Autodesk* | Remove-AppxPackage
Get-AppxPackage Microsoft.BingFinance | Remove-AppxPackage
Get-AppxPackage Microsoft.BingNews | Remove-AppxPackage
Get-AppxPackage Microsoft.BingSports | Remove-AppxPackage
Get-AppxPackage Microsoft.BingWeather | Remove-AppxPackage
Get-AppxPackage *BubbleWitch* | Remove-AppxPackage
Get-AppxPackage king.com.CandyCrush* | Remove-AppxPackage
Get-AppxPackage Microsoft.CommsPhone | Remove-AppxPackage
Get-AppxPackage *Dropbox* | Remove-AppxPackage
Get-AppxPackage *Facebook* | Remove-AppxPackage
Get-AppxPackage Microsoft.WindowsFeedbackHub | Remove-AppxPackage
Get-AppxPackage *Keeper* | Remove-AppxPackage
Get-AppxPackage Microsoft.WindowsMaps | Remove-AppxPackage
Get-AppxPackage *MarchofEmpires* | Remove-AppxPackage
Get-AppxPackage *Disney* | Remove-AppxPackage
Get-AppxPackage *Twitter* | Remove-AppxPackage
Get-AppxPackage *Minecraft* | Remove-AppxPackage  
Get-AppxPackage *Netflix* | Remove-AppxPackage
Get-AppxPackage *Plex* | Remove-AppxPackage
Get-AppxPackage *spotify* | Remove-AppxPackage
Get-AppxPackage *McAfee* | Remove-AppxPackage
Get-AppxPackage Microsoft.Microsoft3DViewer | Remove-AppxPackage
Get-AppxPackage Microsoft.GetHelp | Remove-AppxPackage
Get-AppxPackage Microsoft.XboxGamingOverlay | Remove-AppxPackage
Get-AppxPackage Microsoft.Print3D | Remove-AppxPackage
Get-AppxPackage Microsoft.XboxGameOverlay | Remove-AppxPackage
Get-AppxPackage Microsoft.MicrosoftStickyNotes | Remove-AppxPackage
Get-AppxPackage Microsoft.MSPaint | Remove-AppxPackage
```

### Create shortcut to Fish shell

- run `cmd`
- right-click in taskbar > Pin to taskbr
- right-click again in taskbar > right-click on `Command Prompt` > Properties
- change `Target` to `C:\cygwin64\bin\fish.exe --login --interactive --init-command=d`
- add shortcut key `CTRL+SHIFT+T`
- change icon to `c:\cygwin64\home\kevlar\.config\install\fish.ico`

### Cleanup

1. remove bloatware
1. remove "Edit with Paint3d" file context menu entry:
   - open `regedit`
   - go to `HKEY_LOCAL_MACHINE\SOFTWARE\Classes\SystemFileAssociations\.jpeg\Shell`
   - delete `3D Edit`
1. go to `Turn Windows features on or off` and disable all useless options
1. disable web results in Windows search
1. search for `mobile hotspot` and disable
1. make Explorer open in `This PC`: Explorer > View > Options > Change folder and Search options > Open File Explorer to
1. make Fish the default shell
   - create `SHELL` environment variable containing `/usr/bin/fish`
1. Disable Windows virtual memory
   - Windows search: advanced system settings
   - "Advanced" tab
   - "Performance" settings button
   - "Advanced" tab
   - "Virtual Memory" section > Change
   - "no paging file" option
1. Map Caps Lock to Esc via [SharpKeys](https://github.com/randyrants/sharpkeys/releases)
1. add `c:\cygwin64\bin` and `c:\Users\kevlar\bin` to the PATH
1. disable hotkey to change keyboard language
   - Modern Settings app > Region and Language > Advanced keyboard settings > Language bar options > Advanced Key Settings tab
1. disable file indexing on c: drive
1. disable Windows Defender (it makes Git slow)
