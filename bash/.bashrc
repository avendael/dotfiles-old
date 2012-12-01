if [[ $OSTYPE == darwin* ]]; then
    export EDITOR="/usr/local/Cellar/emacs/24.2/bin/emacsclient"
    export WORKON_HOME=~/Development/Libraries/python-venv
    export ANDROID_SDK_HOME=~/Development/Libraries/android-sdk-macosx
<<<<<<< HEAD
    export PATH=~/bin:${ANDROID_SDK_HOME}/platform-tools:/usr/local/Cellar/ctags/5.8/bin:/usr/local/bin:/usr/local/sbin:${ANDROID_SDK_HOME}/tools:${PATH}
=======
    export PATH=~/bin:${ANDROID_SDK_HOME}/platform-tools:${ANDROID_SDK_HOME}/tools:/usr/local/Cellar/ctags/5.8/bin:/usr/local/bin:/usr/local/sbin:${PATH}
>>>>>>> 03500bbc4923ed7f5c39658d8bf281f52cafe5fe
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
<<<<<<< HEAD
#shopt -s histappend
#PROMPT_COMMAND="history -n; history -a"
#unset HISTFILESIZE
#HISTSIZE=2000

function pg_commands() {
    if [ -z "$1" ]; then
        echo "Usage:"
        echo "    pg_commands startdb [name] - starts postgresql using db postgres or the supplied [name]"
        echo "    pg_commands stopdb [name]  - stops postgresql using db postgres or the supplied [name]"
        echo "    pg_commands help           - print this help message"
    else
        case "$1" in
            "startdb")
                pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start
                ;;
            "stopdb")
                pg_ctl -D /usr/local/var/postgres stop -s -m fast
                ;;
            *)
                echo "Unrecognized command \"$1\""
                return 1
        esac
    fi
}
=======
shopt -s histappend
PROMPT_COMMAND="history -n; history -a"
unset HISTFILESIZE
HISTSIZE=2000
>>>>>>> 03500bbc4923ed7f5c39658d8bf281f52cafe5fe
