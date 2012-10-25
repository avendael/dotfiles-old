if [[ $OSTYPE == darwin* ]]; then
    export EDITOR="/usr/local/Cellar/emacs/24.2/bin/emacsclient"
    export PYTHON_VENV_HOME=~/Development/Libraries/python-venv
    export WORKON_HOME=${PYTHON_VENV_HOME}
    export ANDROID_SDK_HOME=~/Development/Libraries/android-sdk-macosx
    export PATH=~/bin:${ANDROID_SDK_HOME}/platform-tools:${ANDROID_SDK_HOME}/tools:/usr/local/Cellar/ctags/5.8/bin:/usr/local/bin:/usr/local/sbin:${PATH}
    export INFOPATH=/usr/local/share/info/:/usr/local/info/:/usr/local/gnu/info/:/usr/local/gnu/lib/info/:/usr/local/gnu/lib/emacs/info/:/usr/local/emacs/info/:/usr/local/lib/info/:/usr/local/lib/emacs/info/:/usr/share/info/:/usr/local/Cellar/emacs/24.1/share/info/emacs/:/Developer/usr/share/info

    # Include osx specific aliases
    alias ls='ls -G'

    if [ -f `brew --prefix`/etc/bash_completion ]; then
        . `brew --prefix`/etc/bash_completion
    fi

    # Include osx virtualenvwrapper script
    source /usr/local/share/python/virtualenvwrapper.sh
fi

export PS1="\[\e[0;34m\][\u@\h \[\e[0;32m\]\W\[\e[0;34m\]]\$(__git_ps1) \[\e[0;33m\]\$\[\e[0m\] "

# Bash history syncing
shopt -s histappend
PROMPT_COMMAND="history -n; history -a"
unset HISTFILESIZE
HISTSIZE=2000
