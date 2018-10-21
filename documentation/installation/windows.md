## Installation Instructions for Windows

### Install Windows

1. hit `F11` during startup to boot into recovery mode
1. reset this PC
1. create user account "kevlar"
1. install Windows updates
1. install Chrome and log into Github

### Install command-line

3. [Cygwin](https://www.cygwin.com)
    - add fish
    - add git
    - add make
    - add vim
1. Git:
    - [create SSH key](https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent): 
      - `ssh-keygen -t rsa -b 4096 -C "kevin.goslar@gmail.com" -P ""`
      - if the command hangs, provide the password via `-P ""`
      - if `ssh-agent` doesn't start, run `Set-Service ssh-agent -StartupType Manual` in admin PowerShell
    - [add SSH key to Github](https://help.github.com/articles/adding-a-new-ssh-key-to-your-github-account)
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
echo @cd c:\Users\kevin\d > d.cmd
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
cd ..
```

### Cleanup

1. remove bloatware
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
1. add `c:\cygwin64\bin` to the PATH
