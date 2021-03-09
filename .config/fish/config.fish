function ..
  cd ..
end


function ...
  cd ../..
end


function ....
  cd ../../..
end


# cd
function cd

  # perform the cd.
  set __cd_old_path (pwd | wc -c)
  builtin cd $argv
  set __cd_new_path (pwd | wc -c)

  # show new files.
  ls -1
  echo
  if test $__cd_old_path -lt $__cd_new_path
    if test -d .git
      git pull --rebase
      git status
      echo
    end
  end
  set -e __cd_old_path
  set -e __cd_new_path
end


set DAILY_UPDATE_FILE $HOME/.daily_dotfile_checker
if [ ! -f $DAILY_UPDATE_FILE ]; or [ (cat $DAILY_UPDATE_FILE) != (date +'%m/%d/%Y') ]
  eval $HOME/bin/pull_remote_dotfile_updates
  date +'%m/%d/%Y' > $DAILY_UPDATE_FILE
end


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
  set __blue_git_branch "["(set_color blue)(git branch ^/dev/null | grep \* | sed 's/* //')(set_color normal)"]"
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
abbr -ag ga git add .
abbr -ag gp git push
abbr -ag gpf git push --force
abbr -ag gpr git new-pull-request
abbr -ag gs git sync
abbr -ag gsa git sync --all
abbr -ag gtc git town continue
abbr -ag st git status


function gd
  git diff 
end

function gdw
  git diff --color-words 
end

function gdm 
  git diff master 
end

function gdmw 
  git diff master --color-words 
end

function gac
  git add -A
  if [ "$argv" = "" ]
    git commit -m progress
  else
    git commit -m "$argv"
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


# Go
set -x PATH $PATH ~/go/bin


# homebrew
eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)

# Java
# set -g fish_user_paths "/home/linuxbrew/.linuxbrew/opt/openjdk/bin" $fish_user_paths
# set -x JAVA_HOME (dirname (dirname (realpath (which javac))))

# ls
function l
  ls -1
end


# Man pages
set -x LESS_TERMCAP_mb (printf "\e[01;31m")
set -x LESS_TERMCAP_md (printf "\e[01;31m")
set -x LESS_TERMCAP_me (printf "\e[0m")
set -x LESS_TERMCAP_se (printf "\e[0m")
set -x LESS_TERMCAP_so (printf "\e[01;44;33m")
set -x LESS_TERMCAP_ue (printf "\e[0m")
set -x LESS_TERMCAP_us (printf "\e[01;32m")


# Node.JS
set -x PATH ./node_modules/.bin $PATH

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


# Postgres
abbr -ag pg pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start
abbr -ag pg_stop pg_ctl -D /usr/local/var/postgres stop


# Rust
if test -d ~/.cargo
  set -x PATH $PATH ~/.cargo/bin
end

# Tikibase
abbr -ag tb tikibase

# Vim
set sys (uname)
if [ "$sys" = "Linux" ]
  alias v nvim
else
  alias v mvim
end

# Dotfile update checker
check_local_dotfile_updates
