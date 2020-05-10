function ..
  cd ..
end


function ...
  cd ../..
end


function ....
  cd ../../..
end


# Ag
abbr -a a ag -C2


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

function d
  if [ -z $argv ]
    cd ~/d
  else
    cd ~/d/$argv
  end
end


# CTags
function t
  ctags -a -R --exclude=node_modules .
end


# Dotfile update checker
~/bin/check_local_dotfile_updates

set DAILY_UPDATE_FILE $HOME/.daily_dotfile_checker
if [ ! -f $DAILY_UPDATE_FILE ]; or [ (cat $DAILY_UPDATE_FILE) != (date +'%m/%d/%Y') ]
  eval $HOME/bin/pull_remote_dotfile_updates
  date +'%m/%d/%Y' > $DAILY_UPDATE_FILE
end


# Fish
set -U fish_features qmark-noglob

set fish_greeting

# function __fish_preexec_clear --on-event fish_preexec
#   set __green_prompt (set_color green)(prompt_pwd)(set_color normal)
#   set __blue_git_branch "["(set_color blue)(git branch ^/dev/null | grep \* | sed 's/* //')(set_color normal)"]"
#   set __cyan_args (set_color cyan)$argv(set_color normal)

#   clear
#   echo $__green_prompt $__blue_git_branch $__red_last_status '> '$__cyan_args
#   echo
# end

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
abbr -a br git branch
abbr -a co git checkout
abbr -a ga git add .
abbr -a gd git diff
abbr -a gdm git diff master
abbr -a gp git push
abbr -a gpf git push --force
abbr -a gpr git new-pull-request
abbr -a gs git sync
abbr -a gsa git sync --all
abbr -a gtc git town continue
abbr -a st git status

function cs
  git checkout $argv
  git sync
end

function gac
  git add -A
  if [ "$argv" = "" ]
    git commit -m "committing all files"
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


function gacs
  gac $argv
  git sync
end

function gc
  git town continue
end

if test -d /c/Users/kevin/AppData/Roaming/npm
  set -x PATH $PATH /c/Users/kevin/AppData/Roaming/npm
end


# Golang
set -x PATH $PATH ~/go/bin


# homebrew
eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)

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
set -x PATH ./bin ./node_modules/.bin $PATH
if test -d "/c/Program Files/nodejs"
  set -x PATH $PATH "/c/Program Files/nodejs"
end

# Path
set -x PATH $PATH ~/bin /usr/local/bin
if test -d /usr/local/sbin
  set -x PATH $PATH /usr/local/sbin
end

if [ "$PWD" = "/Users/kevlar" ]
  cd ~/d
end


# Postgres
abbr -a pg pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start
abbr -a pg_stop pg_ctl -D /usr/local/var/postgres stop


# Ruby
if [ -d ~/.rbenv/shims ]
	set -x PATH ~/.rbenv/shims $PATH
end
if which rbenv 2> /dev/null
  rbenv rehash >/dev/null
end
# set number_of_cores (sysctl -n hw.ncpu)
# if [ -f ~/.bundle/config ]
#   bundle config --global jobs (expr $number_of_cores)
# end
# set -x PARALLEL_TEST_PROCESSORS (expr $number_of_cores)
set -x COVERALLS_CONFIG nocoveralls


# Tikibase
abbr -a tb tikibase

# Tertestrial
set -x TERTESTRIAL_PREVENT_APP_NAP 1


# Vim
set sys (uname)
if [ "$sys" = "Linux" ]
  alias v nvim
else
  alias v mvim
end
# alias vim /Applications/MacVim.app/Contents/MacOS/Vim


# Visual Studio Code
if [ -d /cygdrive/c/Users/kevlar/AppData/Local/Programs/Microsoft\ VS\ Code/bin ]
	set -x PATH /cygdrive/c/Users/kevlar/AppData/Local/Programs/Microsoft\ VS\ Code/bin $PATH
end
