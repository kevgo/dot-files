# Installation Instructions for Windows

1. [Git](https://git-scm.com/download/win)
1. [Node](https://nodejs.org/en)
    - Yarn: `npm i -g yarn`
1. [MinGW](https://sourceforge.net/projects/mingw/files)
    - add to path
1. [Go](https://golang.org/dl)
    - `mkdir go/src/github.com/Originate`
1. bin folder
    - **br.cmd:** `@git branch %*`
    - **co.cmd:** `@git checkout %*`
    - **d.cmd:** `@cd c:\Users\kevin\d`
    - **gdm.cmd:** `@git diff master`
    - **st.cmd:** `@git status`
1. [Git Town](https://github.com/Originate/git-town/releases)
    - install aliases: `git town alias true`
1. [Visual Studio Code](https://code.visualstudio.com)
    - Cucumber extension
    - ESLint extension
    - Flow Language Support
    - Go extension
1. Map Caps Lock to Esc
    - [SharpKeys](https://github.com/randyrants/sharpkeys)


## Optional

1. [Bash for Windows](https://docs.microsoft.com/en-us/windows/wsl/install-win10)
1. [Fish shell](https://www.kennethreitz.org/essays/fish-as-default-shell-on-windows-10)


## Visual Studio Code

### Sidebar

- **show/hide sidebar:** `ctrl-b`
- **open file:** `enter`
- **show explorer:** `ctrl-d`

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
