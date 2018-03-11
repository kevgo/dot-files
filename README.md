# Kevgo's machine configuration

- [installation instructions for macOS](install_macos.md)
- [installation instructions for Ubuntu](install_ubuntu.md)
- [installation instructions for Manjaro i3](install_manjaro_i3.md)

[i3 cheatsheet](i3_cheatsheet.md)

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
- __[leader]-r__ runs the current file
- __[leader]-c__ enables/disables display of test coverage
- `:GoRename` renames the identifier under the cursor
- `:GoInstall`, `:GoBuild`, `:GoRun`, `:GoTest` with `@:` to re-run and `@@` for subsequent re-runs
- `:GoCoverage` to see test coverage, `:GoCoverageClear` to remove the coverage highlight
- __gd__ jumps to where the identifier under the cursor is defined,
  without needing a tags file
- __[ctrl]-t__ intelligently returns to to previous location in the code base after using _gd_
- the motion commands `if` and `af` select functions
- __[[__ and __]]__ jump between functions in a file
- `:AV` opens the alternative (test) file for the current file in a vertical split pane
- __K__ or `:GoDoc` shows the documentation for the identifier under the cursor
- __[leader]-i__ or `:GoInfo` shows the signature for the function under the cursor
- `:GoReferrers` shows all references to the identifier under the cursor
- `:GoImplements` shows all the interfaces that the identifier under the cursor implements
- `:GoWhicherrs` displays the possible values that the error variable under the cursor can contain
- `:GoChannelPeers` shows all places that send or receive from the cannel under the cursor
- `:GoCallees` shows all functions that can take the place
  of the higher-order function argument under the cursor
  (when a function receives another function as its parameter,
  this hows all the functions that could be provided as that parameter)
- `:GoCallers` shows all places in which the function under the cursor is called
- `:GoImpl` creates the missing methods for the struct under the cursor
  so that it implements the interface provided as a parameter
- `:GoPlay` uploads the current file (or just the selection)
  to the Go Playground and puts the URL into the clipboard


#### Compile YouCompleteMe

```
$ compile_youcompleteme
```


#### Fugitive

- show Git status view: `Gstatus`
- stage/unstage entire files: in the status view, go to the file and press `-`

stage hunks:
- open a file that contains changes: hit `[enter]` in the status view
- run `:Gdiff` inside this file
  - left side is the index file
  - right side is the working copy
  - run `:diffget` while the cursor is inside a change 
    to pull the entire hunk from the other side into this region
  - run `:diffput` to push the current hunk to the other side
  - if lines are selected, `:diffget` and `:diffput` work only on those lines
    
- run `:diffupdate` to refresh the view


undo all changes in a file
- open file
- run `:Gdiff`
- run `:Gwrite` from the index file to write the index to the working copy
- 

commit:
- hit `[shift]-C` in the status window or run `:Gcommit`


when resolving merge conflicts:

```
:GitAdd
```


## Files

All files here belong into the `~/.config` folder, except these ones:
- __bin_folder:__ this folder should be symlinked into `~/bin`
- __home_dir_files:__ these files should be located in the root directory
- __install:__ installation files
