# Kevgo's machine configuration

[installation instructions](install.md)


## Maintenance

- uncommitted changes in the `.config` folder are indicated in the command prompt
- once a day,
  when opening a new terminal window
  it pulls changes from GitHub.


## Details

### Vim

#### jump to definition of code
- __[ctrl]-\\__ opens the definition of the identifier under the cursor in a new tab
- __[ctrl]-]__ or `gd` opens the definition of the identifier under cursor in the current tab
- __[ctrl]-o__ returns to the previous code location
- this requires _ctags_, run `t` or `gt` in the terminal to update the definitions


#### search-and-replace
- `:ag <text>` makes a full-text search for `text`
- __[leader]-w__ searches for the word under the cursor
- __[cmd]-]__ and __[cmd]-[__ jump through search results
- __[cmd]-0__ applies the last operation and jumps to the next search result
- __[backslash] [backslash]__ closes the quickfix window


### code snippets

- __[ctrl]-h__ expands snippets
- `:UltiSnipsEdit` shows/edits the available snippets for the current file


#### preview markdown in Safari:
- `:PrevimOpen`


#### distraction-free mode
- `:Goyo` activate distraction-free mode
- `:Goyo 100` activate distraction-free mode with 100 characters width
- `:Goyo!` disable distraction-free mode
- `:Limelight` activate focus on the current paragraph
- `:Limelight!` disable focus on the current paragraph


#### quick-open files:
- __[leader]-d__


#### Golang

- __[leader]-b__ builds the current project
- __<leader>-r__ runs the current file
- __<leader>-c__ enables/disables display of test coverage
- `:GoRename` renames the identifier under the cursor
- `:GoInstall`, `:GoBuild`, `:GoRun`, `:GoTest` with `@:` to re-run and `@@` for subsequent re-runs
- `:GoCoverage` to see test coverage, `:GoCoverageClear` to remove the coverage highlight
- __gd__ jumps to where the identifier under the cursor is defined,
  without needing a tags file
- __[ctrl]-t__ intelligently returns to to previous location in the code base
- the motion commands `if` and `af` select functions
- __[[__ and __]]__ jump between functions in a file
- `:AV` opens the alternative (test) file for the current file in a vertical split pane
- __K__ or `:GoDoc` shows the documentation for the current identifier
- __<leader>-i__ or `:GoInfo` shows the signature for the function under the cursor
- `:GoReferrers` shows all references to the identifier under the cursor
- `:GoImplements` shows all the interfaces that the identifier under the cursor implments
- `:GoWhicherrs` displays the possible values that the error variable under the cursor can contain
- `:GoChannelPeers` shows all places that send or receive from the cannel under the cursor
- `:GoCallees` shows all functions that can take the place
  of the higher-order function argument under the cursor
  (when a function receives another function as its parameter,
  this hows all the functions that could be provided as that parameter)
- `:GoCallers` shows all places in which the function under the cursor is called
- `:GoImpl` creates the missing methods for the struct under the cursor
  so that it implements the interface provided by the user
- `:GoPlay` uploads the current file to the Go Playground
  and puts the URL into the clipboard


#### Compile YouCompleteMe

```
$ compile_youcompleteme
```


#### Git-add current file

when resolving merge conflicts:

```
:GitAdd
```


## Files

All files here belong into the `~/.config` folder, except these ones:
- __bin_folder:__ this folder should be symlinked into `~/bin`
- __home_dir_files:__ these files should be located in the root directory
- __install:__ installation files
