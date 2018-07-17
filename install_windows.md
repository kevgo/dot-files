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
    echo "@git branch %*" > br.cmd
    echo "@cd %HOMEPATH%" > "cd~.cmd"
    echo "@git checkout %*" > co.cmd
    echo "@cd c:\Users\kevin\d" > d.cmd
    echo "@git diff" > gd.cmd
    echo "@git diff master" > gdm.cmd
    echo "@git status" > st.cmd
    echo "@git add -A" > gac.cmd
    echo "@git commit -m "%*" >> gac.cmd
    echo "@git new-pull-request" > gpr.cmd
    cd ..
    ```
      
1. [Git Town](https://github.com/Originate/git-town/releases)
    - install aliases: `git town alias true`
1. [Visual Studio Code](https://code.visualstudio.com)
    - Cucumber extension
    - ESLint extension
    - Flow Language Support
    - Go extension
1. Map Caps Lock to Esc
    - [SharpKeys](https://github.com/randyrants/sharpkeys)
1. Disable Windows Defender
    - https://www.tenforums.com/tutorials/5918-turn-off-windows-defender-windows-10-a.html


## Optional

1. [Bash for Windows](https://docs.microsoft.com/en-us/windows/wsl/install-win10)
1. [Fish shell](https://www.kennethreitz.org/essays/fish-as-default-shell-on-windows-10)


## Visual Studio Code

### Editor Windows

- switch to next editor window in current group: `ctrl+tab`
- switch to prev editor window in current group: `ctrl+shift+tab`
- switch to next editor group: `ctrl+tab`
- move editor left/right in current group: `ctrl+shift+PageUp/Down`
- move editor to left/right editor group: `ctrl+alt+left/right`


### Sidebar

- **show/hide sidebar:** `ctrl-b`
- **open file:** `enter`
- **show explorer:** `ctrl-d`


### Terminal

- show/hide terminal: ```ctrl+` ```


### User settings

```json
{
    "git.ignoreMissingGitWarning": true,
    "terminal.integrated.shell.windows": "C:\\Program Files\\Git\\bin\\bash.exe",
    "editor.minimap.enabled": false,
    "diffEditor.ignoreTrimWhitespace": false,
    "editor.tabSize": 2,
    "editor.formatOnType": true,
    "files.hotExit": "off",
    "files.insertFinalNewline": true,
    "files.trimFinalNewlines": true,
    "files.trimTrailingWhitespace": true,
    "editor.accessibilitySupport": "off",
    "editor.colorDecorators": false,
    "editor.dragAndDrop": false,
    "editor.emptySelectionClipboard": false,
    "editor.tabCompletion": true,
    "workbench.statusBar.feedback.visible": false,
    "workbench.editor.revealIfOpen": true,
    "workbench.quickOpen.closeOnFocusLost": false,
    "window.autoDetectHighContrast": false,
    "window.enableMenuBarMnemonics": false,
    "window.title": "${activeEditorShort}${separator}${rootName}",
    "explorer.confirmDelete": false,
    "explorer.confirmDragAndDrop": false,
    "search.smartCase": true,
    "flow.useNPMPackagedFlow": true,
    "git.promptToSaveFilesBeforeCommit": true,
    "standard.autoFixOnSave": true,
    "standard.run": "onSave",
    "standard.usePackageJson": true,
    "npm.packageManager": "yarn",
    "npm-intellisense.scanDevDependencies": true,
    "vim.leader": " ",
    "vim.statusBarColorControl": true
}
```

### keybindings.json

```json
// Place your key bindings in this file to overwrite the defaults
[
    {
        "key": "ctrl+d",
        "command": "workbench.files.action.focusFilesExplorer"
    },
    {
        "key": "ctrl+b",
        "command": "-extension.vim_ctrl+b",
        "when": "editorTextFocus && vim.active && vim.use<C-b> && !inDebugRepl && vim.mode != 'Insert'"
    },
    {
        "key": "right",
        "command": "extension.vim_right",
        "when": "editorTextFocus && vim.active && !inDebugRepl && vim.mode == 'Insert'"
    },
    {
        "key": "S",
        "command": "extension.vim_right",
        "when": "editorTextFocus && vim.active && !inDebugRepl && vim.mode != 'Insert'"
    },
    {
        "key": "O",
        "command": "list.select",
        "when": "listFocus && !inputFocus"
    },
    {
        "key": "ctrl+w",
        "command": "workbench.action.closeActiveEditor"
    },
    {
        "key": "ctrl+PageUp",
        "command": "workbench.action.focusNextGroup"
    },
    {
        "key": "ctrl+PageDown",
        "command": "workbench.action.focusPreviousGroup"
    },
    {
        "key": "ctrl+shift+s",
        "command": "workbench.action.files.saveAll"
    },
    {
        "key": "ctrl+k s",
        "command": "-workbench.action.files.saveAll"
    },
    {
        "key": "ctrl+shift+tab",
        "command": "workbench.action.previousEditor"
    },
    {
        "key": "ctrl+pageup",
        "command": "-workbench.action.previousEditor"
    },
    {
        "key": "ctrl+tab",
        "command": "workbench.action.nextEditor"
    },
    {
        "key": "ctrl+pagedown",
        "command": "-workbench.action.nextEditor"
    }
]
```
