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
- __[ctrl]-\\__ opens the method under the cursor in a new tab
- __[ctrl]-]__ opens the method under cursor in the current tab
- __[ctrl]-o__ returns to the previous code location
- this requires _ctags_, run `t` in the terminal to update the definitions

#### search-and-replace
- __[leader]-w__ searches for the word under the cursor
- __[cmd]-]__ and __[cmd]-[__ jump through search results
- __[cmd]-0__ applies the last operation and jumps to the next search result
- __[backspace] [backspace]__ closes the quickfix window

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

#### Compile YouCompleteMe

```
compile_youcompleteme
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
