# This file configures the Windows Git Bash prompt

PS1='\[\033]0;$TITLEPREFIX:$PWD\007\]' # set window title
PS1="$PS1"'\n'                 # new line
PS1="$PS1"'\[\033[33m\]'       # change to brownish yellow
PS1="$PS1"'\w'                 # current working directory
GIT_EXEC_PATH="$(git --exec-path 2>/dev/null)"
COMPLETION_PATH="${GIT_EXEC_PATH%/libexec/git-core}"
COMPLETION_PATH="${COMPLETION_PATH%/lib/git-core}"
COMPLETION_PATH="$COMPLETION_PATH/share/git/completion"
if test -f "$COMPLETION_PATH/git-prompt.sh"
then
  . "$COMPLETION_PATH/git-completion.bash"
  . "$COMPLETION_PATH/git-prompt.sh"
  PS1="$PS1"'\[\033[36m\]'  # change color to cyan
  PS1="$PS1"'`__git_ps1`'   # bash function
fi
PS1="$PS1"'\[\033[0m\]'        # change color
PS1="$PS1"' > '             # prompt
PS1="$PS1"'\[\033[1;33m\]'        # change color
trap 'tput sgr0' DEBUG
