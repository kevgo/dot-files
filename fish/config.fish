function ..
  cd ..
end


function ...
  cd ../..
end


function ....
  cd ../../..
end


abbr -a a ag -C2


abbr -a br git branch


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


# CTags
function t
  ctags -a -R --exclude=node_modules .
end

abbr -a co git checkout


function cs
  git checkout $argv
  git sync
end


function d
  if [ -z $argv ]
    cd ~/d
  else
    cd ~/d/$argv
  end
end


set fish_greeting


function fish_title
  prompt_pwd
end


function fish_user_key_bindings
  bind \cv backward-kill-word
  bind \cb backward-word
  bind \cg accept-autosuggestion
end


# PROMPT
function fish_prompt --description 'Write out the prompt'

  # Just calculate these once, to save a few cycles when displaying the prompt
  if not set -q __fish_prompt_normal
      set -g __fish_prompt_normal (set_color normal)
  end

  if not set -q __git_cb
      set __git_cb " ["(set_color blue)(git branch ^/dev/null | grep \* | sed 's/* //')(set_color normal)"]"
  end

  if not set -q __fish_prompt_cwd
      set -g __fish_prompt_cwd (set_color $fish_color_cwd)
  end

  printf '\n%s%s%s%s > ' $__fish_prompt_cwd (prompt_pwd) $__fish_prompt_normal $__git_cb
end


abbr -a gp git push
abbr -a gpf git push --force
abbr -a gpr git new-pull-request

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

abbr -a gd git diff
abbr -a gdm git diff master
abbr -a gs git sync
abbr -a gsa git sync --abort
abbr -a gsc git sync --continue

function l
  ls -1
end


# PATH
set -x PATH ~/Dropbox/bin ~/d/go/src/github.com/Originate/git-town/src /usr/local/bin /usr/local/sbin $PATH
set -x PATH ./bin ./node_modules/.bin $PATH


abbr -a pg pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start
abbr -a pg_stop pg_ctl -D /usr/local/var/postgres stop


# Go
set -x PATH ~/d/go/bin ~/d/go-external/bin /usr/local/opt/go/libexec/bin $PATH
set -x GOPATH $HOME/d/go-external:$HOME/d/go


# Ruby
set -x PATH $PATH ~/.rbenv/shims
rbenv rehash >/dev/null ^&1
abbr -a rs bundle exec rails s
abbr -a rc bundle exec rails c
set number_of_cores (sysctl -n hw.ncpu)
if not test -f ~/.bundle/config
  bundle config --global jobs (expr $number_of_cores)
end
set -x PARALLEL_TEST_PROCESSORS (expr $number_of_cores)
set -x COVERALLS_CONFIG nocoveralls


abbr -a st git status
abbr -a co git checkout


alias v mvim
alias vim /Applications/MacVim.app/Contents/MacOS/Vim


# color man pages
set -x LESS_TERMCAP_mb (printf "\e[01;31m")
set -x LESS_TERMCAP_md (printf "\e[01;31m")
set -x LESS_TERMCAP_me (printf "\e[0m")
set -x LESS_TERMCAP_se (printf "\e[0m")
set -x LESS_TERMCAP_so (printf "\e[01;44;33m")
set -x LESS_TERMCAP_ue (printf "\e[0m")
set -x LESS_TERMCAP_us (printf "\e[01;32m")


# Run this job once a day
if [ ! -f ~/.daily_job ]; or [ (cat ~/.daily_job) != (date +'%m/%d/%Y') ]
  echo RUNNING DAILY TASK
  date +'%m/%d/%Y' > ~/.daily_job
end

# Startup path
if [ "$PWD" = "/Users/kevin" ]
  cd ~/d
end


# Tertestrial
set -x TERTESTRIAL_PREVENT_APP_NAP 1
