function ..
  cd ..
end


function ...
  cd ../..
end


function ....
  cd ../../..
end


# atalanta
if test -f "$HOME/.cargo/bin/a"
  "$HOME/.cargo/bin/a" --setup-fish-completions | source
end


# cd
function cd --wraps 'cd'

  # perform the cd.
  set old_git_path (git_path)
  builtin cd $argv
  set new_git_path (git_path)

  # show the files in the new folder
  ls -1
  echo

  # check if we entered a new Git repo
  if test -z $new_git_path
    # new folder is not a Git repo
    return
  end
  if test "$old_git_path" = "$new_git_path"
    # cd within the same Git repo
    return
  end

  # pull Git updates
  git pull --rebase
  git status
  echo
end


# Prints the root path of the current Git directory,
# or nothing it this isn't a Git directory.
# Doesn't traverse above the home directory.
function git_path
  set cwd (pwd)
  while true
    if test -d (string join / $cwd ".git")
      # $cwd contains a ".git" dir
      echo $cwd
      return
    end
    if test $cwd = $HOME
      # we reached the home dir
      return
    end
    if test $cwd = "/"
      # we reached the root dir
      return
    end
    set cwd (dirname $cwd)
  end
end


# environment
set -x EDITOR nvim


# Fish
set -U fish_features qmark-noglob
set fish_greeting

function fish_title
  prompt_pwd
end

function bind_bang
  switch (commandline -t)
  case "!"
    commandline -t $history[1]; commandline -f repaint
  case "*"
    commandline -i !
  end
end

function bind_dollar
  switch (commandline -t)
  case "!"
    commandline -t ""
    commandline -f history-token-search-backward
  case "*"
    commandline -i '$'
  end
end

function fish_user_key_bindings
  bind \cv backward-kill-word
  bind \cb backward-word
  bind \cg accept-autosuggestion
  bind ! bind_bang
  bind '$' bind_dollar
end

function fish_prompt 
  set -f last_status $status
  echo
  set -f old_pwd (pwd)
  builtin cd $HOME/.dot-files
  set -f config_changes (git status --porcelain | wc -l | tr -d ' ')
  builtin cd $old_pwd
  if [ "$config_changes" != "0" ]
    echo (set_color BBBBBB)'(config changes)'
  end
  set -f green_path (set_color green)(prompt_pwd)(set_color normal)
  set -f git_branch (git rev-parse --abbrev-ref HEAD 2> /dev/null)
  if [ -n "$git_branch" ]
    set -f blue_git_branch " ["(set_color blue)$git_branch(set_color normal)"]"
  else
    set -f blue_git_branch ""
  end
  if [ $last_status -ne 0 ]
    set -f red_last_status ' '(set_color -b red)(set_color white)(echo " $last_status ")(set_color normal)
  else
    set -f red_last_status ''
  end
  set -f pending_gittown_command (git-town status --pending)
  if [ -n "$pending_gittown_command" ]
    set -f yellow_pending_gittown_command ' '(set_color -b yellow)(set_color black)(echo " $pending_gittown_command ")(set_color normal)
  else
    set -f yellow_pending_gittown_command ''
  end
  printf '%s%s%s%s > ' $green_path $blue_git_branch $yellow_pending_gittown_command $red_last_status
end


# Git
abbr -ag b git b
abbr -ag br git town branch
abbr -ag co git checkout
abbr -ag gp git push
abbr -ag gpf git push --force
abbr -ag gpr git propose
abbr -ag gs git sync
abbr -ag gsa git sync --all
abbr -ag gsp git sync --prune
abbr -ag gss git sync --stack
abbr -ag gtc git town continue
abbr -ag gts git town switch
abbr -ag gtsa git town switch -a
abbr -ag st git status

function ga
  git add -A
end

function gaac
  git add -A
  git commit --amend --no-edit
end

function gac
  ga
  if [ ! -z "$argv" ]
    git commit -m "$argv"
  else
    set -l files (git status --porcelain | cut -c4- | awk '{print $NF}' | xargs -L1 basename | sed 's/\\.md$//')
    #                                      |          |                   |                    remove ".md" extensions
    #                                      |          |                   remove parent directory names
    #                                      |          use only the last filename (when renaming files)
    #                                      remove Git status indicators
    git commit -m "$files"
  end
end

function gacp
  gac $argv
  git push
end

function gacpr
  gac $argv
  git new-pull-request
end

function gacs
  ga
  if [ ! -z "$argv" ]
    git commit -m "$argv [skip ci]"
  else
    set -l files (git status --porcelain | cut -c4- | awk '{print $NF}' | xargs -L1 basename | sed 's/\\.md$//')
    #                                      |          |                   |                    remove ".md" extensions
    #                                      |          |                   remove parent directory names
    #                                      |          use only the last filename (when renaming files)
    #                                      remove Git status indicators
    git commit -m "$files [skip ci]"
  end
end

function gacsp
  gacs $argv
  git push
end

function gd
  git diff 
end

function gdc
  git diff --word-diff-regex=.
end

function gdw
  git diff --color-words 
end

function gdp
  git diff-parent
end

function gdpw
  git diff-parent -w
end

function gdm 
  git diff main 
end

function gdms
  git diff master
end

function gdmsw
  git diff master --color-words
end

function gdmw 
  git diff main --color-words
end

function gt
  git-town $argv
end

# Go
set -x PATH $PATH ~/go/bin
if test -d /usr/local/go/bin
  set -x PATH $PATH /usr/local/go/bin
end


# homebrew
if test -d /opt/homebrew/bin
  eval (/opt/homebrew/bin/brew shellenv)
end


# Java
# set -g fish_user_paths "/home/linuxbrew/.linuxbrew/opt/openjdk/bin" $fish_user_paths
# set -x JAVA_HOME (dirname (dirname (realpath (which javac))))


# ls
function l
  ls -1
end


# macOS
if test -d "$HOME/d"
  function d
    cd "$HOME/d"
  end
end


# Make
abbr -ag ac a cuke
abbr -ag act a cukethis
abbr -ag at a test
abbr -ag au a unit
abbr -ag al a lint
abbr -ag mc make cuke
abbr -ag mct make cukethis
abbr -ag mt make test
abbr -ag mtg make test-go
abbr -ag mu make unit
abbr -ag ml make lint


# Man pages
set -x LESS_TERMCAP_mb (printf "\e[01;31m")
set -x LESS_TERMCAP_md (printf "\e[01;31m")
set -x LESS_TERMCAP_me (printf "\e[0m")
set -x LESS_TERMCAP_se (printf "\e[0m")
set -x LESS_TERMCAP_so (printf "\e[01;44;33m")
set -x LESS_TERMCAP_ue (printf "\e[0m")
set -x LESS_TERMCAP_us (printf "\e[01;32m")


# Mrt
if test -f ~/.cargo/bin/mrt
  ~/.cargo/bin/mrt activate | source
  abbr -ag mi m ignore
  abbr -ag mn m next
  abbr -ag mia m ignore-all
end

# Node.JS
set -x PATH ./node_modules/.bin $PATH
if test -d /usr/local/lib/nodejs/bin
  set -x PATH $PATH /usr/local/lib/nodejs/bin
end
if test -d ~/.config/yarn/global/node_modules/.bin
  set -x PATH $PATH ~/.config/yarn/global/node_modules/.bin
end


# Path
set -x PATH ~/bin $PATH /usr/local/bin 
if test -d /usr/local/sbin
  set -x PATH $PATH /usr/local/sbin
end
if test -d ~/bin_local
  set -x PATH ~/bin_local $PATH 
end
if test -d ~/bin_chromeos
  set -x PATH ~/bin_chromeos $PATH 
end
if test -d ~/bin_linux
  set -x PATH ~/bin_linux $PATH 
end
if test -d ~/bin_fedora
  set -x PATH ~/bin_fedora $PATH 
end
if test -d ~/.local/bin
  set -x PATH ~/.local/bin $PATH 
end


# Postgres
abbr -ag pg pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start
abbr -ag pg_stop pg_ctl -D /usr/local/var/postgres stop


# Python
# if test -f /opt/homebrew/anaconda3/bin/conda
#     eval /opt/homebrew/anaconda3/bin/conda "shell.fish" "hook" $argv | source
# end
# if test -d /opt/homebrew/anaconda3/bin
#   set -x PATH /opt/homebrew/anaconda3/bin $PATH
#   conda init fish
# end

# Ruby
#                ---- macOS ------------             ---- Fedora ---------------------
if test -f /opt/homebrew/bin/rbenv
  status --is-interactive; and rbenv init - --no-rehash fish | source
end
if test -f ~/.rbenv/libexec/rbenv
  set -x PATH $PATH ~/.rbenv/libexec
  status --is-interactive; and rbenv init - --no-rehash fish | source
end

# Rust
if test -d ~/.cargo
  set -x PATH ~/.cargo/bin $PATH 
end
abbr -ag cc cargo check


# Tikibase
abbr -ag tb tikibase
abbr -ag tp tikibase p


# Vim
alias v nvim


# Dotfile update checker
check_local_dotfile_updates


# bat
# Note: this must come after Rust since it uses the PATH set in that section
if test -f "$HOME/.cargo/bin/bat"
  alias cat bat
end
if test -f /usr/bin/bat
  alias cat bat
end


set TODAY (date +'%m/%d/%Y')
set DAILY_UPDATE_FILE "$HOME/.daily_dotfile_checker"
if [ ! -f $DAILY_UPDATE_FILE ]; or [ (cat $DAILY_UPDATE_FILE) != "$TODAY" ]
  eval "$HOME/bin_linux/pull_remote_dotfile_updates"
  echo "$TODAY" > $DAILY_UPDATE_FILE
end


if test (uname) = "Darwin"
  if test "$TERM_PROGRAM" != "vscode"; then
    cd ~/d
  end
end
