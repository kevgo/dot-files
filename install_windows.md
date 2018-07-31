# Installation Instructions for Windows

1. [Git](https://git-scm.com/download/win)
1. [Node](https://nodejs.org/en)
    - Yarn: `npm i -g yarn`
1. [MinGW](https://sourceforge.net/projects/mingw/files)
    - add to path
1. [Go](https://golang.org/dl)
    - `mkdir go/src/github.com/Originate`
1. bin folder
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
      
1. [Git Town](https://github.com/Originate/git-town/releases)
    - install aliases: `git town alias true`
1. Map Caps Lock to Esc
    - [SharpKeys](https://github.com/randyrants/sharpkeys)
1. Disable Windows Defender
    - https://www.tenforums.com/tutorials/5918-turn-off-windows-defender-windows-10-a.html


## Optional

1. [Bash for Windows](https://docs.microsoft.com/en-us/windows/wsl/install-win10)
1. [Fish shell](https://www.kennethreitz.org/essays/fish-as-default-shell-on-windows-10)


## Visual Studio Code

### Config Files

- [user settings](/windows/user-settings.json)
- [keybindings.json](/windows/keybindings.json)

### Install Extensions

- TypeScript support
- Vim extension
- Cucumber extension
- ESLint extension
- TSLint extension
- Flow Language Support
- Go extension



### Editor Windows

- switch to next editor window in current group: `ctrl+tab`
- switch to prev editor window in current group: `ctrl+shift+tab`
- switch to next editor group: `ctrl+tab`
- move editor left/right in current group: `ctrl+shift+PageUp/Down`
- move editor to left/right editor group: `ctrl+alt+left/right`
- go to definition: `gd`


#### Editing

- quick fix: `cmd+.`
- see problems: `cmd+shift+M`


#### Git

- open Git window: `ctrl+shift+G`
- stage file: in the Git window, navigate to the file, hit `o` to open (select) it, then `s` to stage


### Sidebar

- **show/hide sidebar:** `ctrl-b`
- **open file:** `enter`
- **show explorer:** `ctrl-d`


### Terminal

- show/hide terminal: ```ctrl+` ```
