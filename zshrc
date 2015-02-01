# -*- mode: shell-script -*-
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="avendael"
COMPLETION_WAITING_DOTS="true"
DISABLE_AUTO_TITLE=true

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"
export github_user="avendael"

plugins=(git fasd brew tmux)

source $ZSH/oh-my-zsh.sh

# User configuration
export KEYTIMEOUT=1

if [[ $OSTYPE == darwin* ]]; then
    export EDITOR=emacsclient
    export LANG=en_US.UTF-8
    export LC_ALL=en_US.UTF-8

    if dvm env > /dev/null; then
        eval $(dvm env)
    fi

    export ANDROID_HOME=~/Development/Libraries/android-sdk-macosx
    export PYTHON_HOME=~/Library/Python/2.7
    export ATOM_REPOS_HOME=~/Development/Projects/atom
    export PROJECTS_HOME=~/Development/Projects
    export AWS_HOME=~/.aws
    export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home

    export GOVERSION=$(brew list go | head -n 1 | cut -d '/' -f 6)
    export GOPATH=~/Development/go
    export GOROOT=$(brew --prefix)/Cellar/go/$GOVERSION

    export MAILDIR_CACHE=~/Library/Caches/OfflineImap
    export NVM_DIR=~/.nvm
    export PATH=~/bin:${PYTHON_HOME}/bin:${GOPATH}/bin:${ANDROID_HOME}/platform-tools:${ANDROID_HOME}/tools:${EC2_HOME}/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin

    # Include osx specific aliases
    alias ls='ls -G'

    # Include osx virtualenvwrapper script
    if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
        . /usr/local/bin/virtualenvwrapper.sh
    else
        echo "Virtualenvwrapper not found"
    fi

    # Include nvm
    source $(brew --prefix nvm)/nvm.sh

    # Include AWS keys
    if [ -f ${AWS_HOME}/env.sh ]; then
        . ${AWS_HOME}/env.sh
    fi
fi

#export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin"
# export MANPATH="/usr/local/man:$MANPATH"

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# zsh behave inside emacs
if [[ -n "$INSIDE_EMACS" && "$TERM" != "dumb" ]]; then
    chpwd() { print -P "\033AnSiTc %d" }
    print -P "\033AnSiTu %n"
    print -P "\033AnSiTc %d"
fi

# Use rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Use fasd
eval "$(fasd --init auto)"

# Show insert or normal mode
function zle-line-init zle-keymap-select {
    VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]% %{$reset_color%}"
    RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $EPS1"
    zle reset-prompt
}

function show_ansi_colors {
    for i in {0..255} ; do
        printf "\x1b[38;5;${i}mcolour${i}\n"
    done
}

function kill_emacs_daemon {
    emacsclient -e "(kill-emacs)"
}

zle -N zle-line-init
zle -N zle-keymap-select

if [[ $TERM == dumb ]]; then
    export NODE_NO_READLINE=1
fi

alias c=clear
alias gss="git status -sb"
alias e="f -e emacsclient -n"
alias en="emacsclient -n"
alias et="emacsclient -t"
