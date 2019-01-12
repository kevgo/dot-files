## Visual Studio Code

### Config Files

- [user settings](user-settings.json)
- [keybindings.json](keybindings.json)
- [typescript.json](typescript.json)

You can sort alphabetically using http://novicelab.org/jsonabc
but re-paste back into VSCode to get the VSCode formatting before updating Github.

### Installation

- install command-line client: `[cmd]-[shift]-P` > `shell command`

Extensions: run `~/bin/vspluginload` to install all VSCode extensions

Starting to display sharp on external monitor on ChromeOS:

```
env GDK_SCALE=3 sommelier -X --scale=2 --dpi=160 /usr/share/code/code .
```

Make it use the Dvorak layout on ChromeOS: set `keyboard.dispatch` to `keyCode`

### Hotkeys

#### Navigation

- switch to next editor window in current group: `ctrl+tab`
- switch to prev editor window in current group: `ctrl+shift+tab`
- switch to next editor group: `ctrl+tab`
- move editor left/right in current group: `ctrl+shift+PageUp/Down`
- move editor to left/right editor group: `ctrl+alt+left/right`
- **show/hide sidebar:** `ctrl-b`
- **open file:** `enter`
- **show explorer:** `ctrl-d`
- go to definition: `gd`
- go back: `[ctrl]-[minus]`


#### Editing

- quick fix: `cmd+.`
- see problems: `cmd+shift+M`
- see mouse hover information: `gh`


#### Git

- open Git window: `ctrl+shift+G`
- stage file: in the Git window, navigate to the file, hit `o` to open (select) it, then `s` to stage


#### Terminal

- show/hide terminal: ```ctrl+` ```
