export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="avendael"
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git fasd brew)

source $ZSH/oh-my-zsh.sh

# User configuration
export KEYTIMEOUT=1

if [[ $OSTYPE == darwin* ]]; then
    export EDITOR=/usr/local/bin/vim
    export DOCKER_HOST=tcp://localhost:4243
    export LC_ALL=en_US.UTF-8
    export LANG=en_US.UTF-8
    export EC2_HOME=~/.ec2
    export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home
    export PROJECTS_HOME=~/Development/Projects
    export GOPATH=~/Development/Libraries/go
    export ANDROID_HOME=~/Development/Libraries/android-sdk-macosx
    export MAILDIR_CACHE=~/Library/Caches/OfflineImap
    export NPM_HOME=/usr/local/Cellar/node/`node --version | tr -d 'v'`/lib/node_modules/npm
    export ATOM_REPOS_HOME=~/Development/Projects/atom
    export PATH=~/bin:${GOPATH}/bin:${ANDROID_HOME}/platform-tools:${ANDROID_HOME}/tools:${EC2_HOME}/bin:${NPM_HOME}/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin

    # Include osx specific aliases
    alias ls='ls -G'

    # Include osx virtualenvwrapper script
    if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
        . /usr/local/bin/virtualenvwrapper.sh
    else
        echo "Virtualenvwrapper not found"
    fi

    # Include EC2 keys
    if [ -f ${EC2_HOME}/env.sh ]; then
        . ${EC2_HOME}/env.sh
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

zle -N zle-line-init
zle -N zle-keymap-select

if [[ $TERM == dumb ]]; then
    export NODE_NO_READLINE=1
fi

alias c=clear
