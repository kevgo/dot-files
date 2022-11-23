## Vim

#### jump to definition of code

- **[ctrl]-\\** opens the definition of the identifier under the cursor in a new
  tab
- **[ctrl]-]** or `gd` opens the definition of the identifier under cursor in
  the current tab
- **[ctrl]-o** returns to the previous code location
- this requires _ctags_, run `t` or `gt` in the terminal to update the
  definitions

#### search-and-replace

- `:ag <text>` makes a full-text search for `text`
- **[leader]-w** searches for the word under the cursor
- **[cmd]-]** and **[cmd]-[** jump through search results
- **[cmd]-0** applies the last operation and jumps to the next search result
- **[backslash][backslash]** closes the quickfix window

### code snippets

- **[ctrl]-h** expands snippets
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

- **[leader]-d**

#### Golang

- **[leader]-b** builds the current project
- **[leader]-r** runs the current file
- **[leader]-c** enables/disables display of test coverage
- `:GoRename` renames the identifier under the cursor
- `:GoInstall`, `:GoBuild`, `:GoRun`, `:GoTest` with `@:` to re-run and `@@` for
  subsequent re-runs
- `:GoCoverage` to see test coverage, `:GoCoverageClear` to remove the coverage
  highlight
- **gd** jumps to where the identifier under the cursor is defined, without
  needing a tags file
- **[ctrl]-t** intelligently returns to to previous location in the code base
  after using _gd_
- the motion commands `if` and `af` select functions
- **[[** and **]]** jump between functions in a file
- `:AV` opens the alternative (test) file for the current file in a vertical
  split pane
- **K** or `:GoDoc` shows the documentation for the identifier under the cursor
- **[leader]-i** or `:GoInfo` shows the signature for the function under the
  cursor
- `:GoReferrers` shows all references to the identifier under the cursor
- `:GoImplements` shows all the interfaces that the identifier under the cursor
  implements
- `:GoWhicherrs` displays the possible values that the error variable under the
  cursor can contain
- `:GoChannelPeers` shows all places that send or receive from the cannel under
  the cursor
- `:GoCallees` shows all functions that can take the place of the higher-order
  function argument under the cursor (when a function receives another function
  as its parameter, this hows all the functions that could be provided as that
  parameter)
- `:GoCallers` shows all places in which the function under the cursor is called
- `:GoImpl` creates the missing methods for the struct under the cursor so that
  it implements the interface provided as a parameter
- `:GoPlay` uploads the current file (or just the selection) to the Go
  Playground and puts the URL into the clipboard

#### Compile YouCompleteMe

```
$ compile_youcompleteme
```

#### Fugitive

- show Git status view: `Gstatus`
- stage/unstage entire files: in the status view, go to the file and press `-`

stage hunks:

- open a file that contains changes: hit `[enter]` in the status view
- close NERDtree
- run `:Gdiff` inside this file
  - left side is the index file
  - right side is the working copy
  - run `:diffget` or type `do` (diff obtain) while the cursor is inside a
    change to pull the entire hunk from the other side into this region
  - run `:diffput` or type `dp` to push the current hunk to the other side
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
