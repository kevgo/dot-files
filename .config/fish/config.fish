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

  "$HOME/.cargo/bin/a" --print-fish-completions | source
end


# cd
function cd

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

function fish_prompt --description 'Write out the prompt'
  set -l last_status $status
  echo
  set old_pwd (pwd)
  builtin cd $HOME/.dot-files
  set config_changes (git status --porcelain | wc -l | tr -d ' ')
  builtin cd $old_pwd
  if [ "$config_changes" != "0" ]
    echo (set_color BBBBBB)'(config changes)'
  end
  set __green_prompt (set_color green)(prompt_pwd)(set_color normal)
  set __blue_git_branch "["(set_color blue)(git branch 2> /dev/null | grep \* | sed 's/* //')(set_color normal)"]"
  if [ $last_status -ne 0 ]
    set __red_last_status " "(set_color -b red)(set_color white)(echo " $last_status ")(set_color normal)
  else
    set __red_last_status ""
  end
  echo $__green_prompt $__blue_git_branch$__red_last_status '> '
end


# Git
abbr -ag b git b
abbr -ag br git branch
abbr -ag co git checkout
abbr -ag gp git push
abbr -ag gpf git push --force
abbr -ag gpr git new-pull-request
abbr -ag gs git sync
abbr -ag gsa git sync --all
abbr -ag gtc git town continue
abbr -ag st git status

function ga
  git add -A
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

function gd
  git diff 
end

function gdw
  git diff --color-words 
end

function gdm 
  git diff main 
end

function gdmw 
  git diff main --color-words 
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


# Make
abbr -ag mc make cuke
abbr -ag mct make cukethis
abbr -ag mt make test
abbr -ag mu make unit
abbr -ag ml make lint
abbr -ag mp make p


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


# Ruby
if test -d ~/.rbenv
  set -x PATH ~/.rbenv/bin $PATH
  rbenv init - fish | source
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


set DAILY_UPDATE_FILE $HOME/.daily_dotfile_checker
if [ ! -f $DAILY_UPDATE_FILE ]; or [ (cat $DAILY_UPDATE_FILE) != (date +'%m/%d/%Y') ]
  eval $HOME/bin_linux/pull_remote_dotfile_updates
  date +'%m/%d/%Y' > $DAILY_UPDATE_FILE
end
