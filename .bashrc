MAX_PROMPT_LEN=35

getPrompt() {
    currentWorkingDir=${PWD/#$HOME/\~}
    if (( ${#currentWorkingDir} > $MAX_PROMPT_LEN )); then
        currentWorkingDir=.../${PWD##*/}   
    fi
}

PROMPT_COMMAND=getPrompt

# add color to terminal
#if [ "$TERM" = "xterm-color" ] || [ "$TERM" = "xterm-256color" ]; then
#
#    # Use color if terminal supports it.
#    BLACK="\[$(tput setaf 0)\]"
#    RED="\[$(tput setaf 1)\]"
#    GREEN="\[$(tput setaf 2)\]"
#    YELLOW="\[$(tput setaf 3)\]"
#    BLUE="\[$(tput setaf 4)\]"
#    MAGENTA="\[$(tput setaf 5)\]"
#    CYAN="\[$(tput setaf 6)\]"
#    WHITE="\[$(tput setaf 7)\]"
#    DEFAULT="\[$(tput sgr0)\]"
# 
#    export PS1="${GREEN}\${currentWorkingDir}${WHITE}> ${DEFAULT}"
#else
#    export PS1="\${currentWorkingDir}> "
#fi
export TERM="xterm-color" 
export PS1='\[\e[0;31m\]\u\[\e[0m\]@\[\e[0;32m\]\w\[\e[0m\]\$ '

# Establish a safe environment.
set -o ignoreeof         # Do not log out with <Ctrl-D>.
set -o noclobber         # Do not overwrite files via '>'.
alias rm='rm -i'         # Prompt before removing files via 'rm'.
alias cp='cp -i'         # Prompt before overwriting files via 'cp'.
alias mv='mv -i'         # Prompt before overwriting files via 'mv'.
alias ln='ln -i'         # Prompt before overwriting files via 'ln'.

# Use 'less' instead of 'more'.
# Windows Git Bash provides 'less', but not 'more'.
#alias less='less --quit-at-eof --no-init --tabs=4 --RAW-CONTROL-CHARS'
#alias more='less'

# Add colors to 'ls'.
alias ls='ls -GFha'

# make cd call ls
cd_ls(){ cd $1; ls; }
alias cd=cd_ls $1

# Add color to 'grep' and relatives (when not piped or redirected).
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# When the shell exits, append to the history file instead of overwriting it.
shopt -s histappend

# Make the command-line history ignore duplicate command lines.
export HISTCONTROL=erasedups:ignoredups

# Make the command-line history show dates and times.
export HISTTIMEFORMAT="%F %T "

# nvim
alias nvim='$HOME/nvim-macos/bin/nvim'

# Support non-ASCII characters in terminal.
# Note: use LC_ALL='C' if you want sort to behave in expected way.
export LC_ALL='en_US.UTF-8'
export LANG='en_US.UTF-8'
export LANGUAGE='en_US.UTF-8'

# Suppress OS X warning to change default shell to zsh.
export BASH_SILENCE_DEPRECATION_WARNING=1

export CLICOLORS=1
export LSCOLORS=cxfxgxdxbxegedabagacad
export CLASSPATH=$HOME/Documents/csci232/jars/stdlib.jar:$CLASSPATH
export CLASSPATH=$HOME/Documents/Coding/jars/algs4.jar:$CLASSPATH
export JAVA_HOME=$(/usr/libexec/java_home -v 20.0)
export PATH="/usr/local/opt/curl/bin:$PATH"