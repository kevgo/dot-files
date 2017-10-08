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


# Dog
set -x PATH ~/d/go/src/github.com/Originate/dog/bin ~/d/go/src/github.com/Originate/dog/shims $PATH


# Dotfile update checker
~/bin/check_local_dotfile_updates

set DAILY_UPDATE_FILE $HOME/.daily_dotfile_checker
if [ ! -f $DAILY_UPDATE_FILE ]; or [ (cat $DAILY_UPDATE_FILE) != (date +'%m/%d/%Y') ]
  $HOME/bin/pull_remote_dotfile_updates
  date +'%m/%d/%Y' > $DAILY_UPDATE_FILE
end


# Fish
set fish_greeting

function fish_title
  prompt_pwd
end

function fish_user_key_bindings
  bind \cv backward-kill-word
  bind \cb backward-word
  bind \cg accept-autosuggestion
end

function fish_prompt --description 'Write out the prompt'
  echo
  set __green_prompt (set_color green)(prompt_pwd)(set_color normal)
  set __blue_git_branch "["(set_color blue)(git branch ^/dev/null | grep \* | sed 's/* //')(set_color normal)"]"
  set old_pwd (pwd)
  builtin cd $HOME/.config
  set dotfile_changes (git status --porcelain | wc -l | tr -d ' ')
  builtin cd $old_pwd
  if [ "$dotfile_changes" != "0" ]
    echo (set_color grey)'(dotfile changes)'
  end
  echo $__green_prompt $__blue_git_branch '> '
end


# Git
abbr -a br git branch
abbr -a co git checkout
abbr -a gd git diff
abbr -a gdm git diff master
abbr -a gp git push
abbr -a gpf git push --force
abbr -a gpr git new-pull-request
abbr -a gs git sync
abbr -a gsa git sync --abort
abbr -a gsc git sync --continue
abbr -a st git status

function cs
  git checkout $argv
  git sync
end

function gac
  git add -A
  if [ "$argv" = "" ]
    git ci -m commit
  else
    git ci -m "$argv"
  end
end

function gacp
  gac $argv
  git push
end


function gacs
  gac $argv
  git sync
end


# Git-Town
set -x PATH ~/d/go/src/github.com/Originate/git-town/src $PATH


# Golang
set -x PATH ~/d/go/bin ~/d/go-external/bin /usr/local/opt/go/libexec/bin $PATH
set -x GOPATH $HOME/d/go-external:$HOME/d/go

function gt
  gotags -R=true -f=tags .
end


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


# Path
set -x PATH ~/bin /usr/local/bin /usr/local/sbin $PATH

if [ "$PWD" = "/Users/kevin" ]
  cd ~/d
end


# Postgres
abbr -a pg pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start
abbr -a pg_stop pg_ctl -D /usr/local/var/postgres stop


# Ruby
set -x PATH ~/.rbenv/shims $PATH
if which rbenv > /dev/null
  rbenv rehash >/dev/null ^&1
end
set number_of_cores (sysctl -n hw.ncpu)
if not test -f ~/.bundle/config
  bundle config --global jobs (expr $number_of_cores)
end
set -x PARALLEL_TEST_PROCESSORS (expr $number_of_cores)
set -x COVERALLS_CONFIG nocoveralls


# Tertestrial
set -x TERTESTRIAL_PREVENT_APP_NAP 1


# Vim
alias v mvim
alias vim /Applications/MacVim.app/Contents/MacOS/Vim
