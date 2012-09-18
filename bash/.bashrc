export PS1="\[\e[0;34m\][\u@\h \[\e[0;32m\]\W\[\e[0;34m\]]\[\e[0;33m\]\\$\[\e[0m\] "

if [[ $OSTYPE == darwin* ]]; then
    export EDITOR="/usr/local/Cellar/emacs/24.2/bin/emacsclient"
    export PYTHON_VENV_HOME=~/Development/Libraries/python-venv
    export WORKON_HOME=${PYTHON_VENV_HOME}
    export ANDROID_SDK_HOME=~/Development/Libraries/android-sdk-macosx
    export PYTHONPATH=/usr/local/lib/python2.7/site-packages/:${PYTHONPATH}
    export PATH=~/bin:${ANDROID_SDK_HOME}/platform-tools:${ANDROID_SDK_HOME}/tools:/usr/local/Cellar/ctags/5.8/bin:/usr/local/bin:/usr/local/sbin:${PATH}
    export INFOPATH=/usr/local/share/info/:/usr/local/info/:/usr/local/gnu/info/:/usr/local/gnu/lib/info/:/usr/local/gnu/lib/emacs/info/:/usr/local/emacs/info/:/usr/local/lib/info/:/usr/local/lib/emacs/info/:/usr/share/info/:/usr/local/Cellar/emacs/24.1/share/info/emacs/:/Developer/usr/share/info

    # Include osx specific aliases
    alias ls='ls -G'

    if [ -f `brew --prefix`/etc/bash_completion ]; then
        . `brew --prefix`/etc/bash_completion
    fi

    # Include osx virtualenvwrapper script
    source /usr/local/bin/virtualenvwrapper_lazy.sh
fi

# Bash history syncing
shopt -s histappend
PROMPT_COMMAND="history -n; history -a"
unset HISTFILESIZE
HISTSIZE=2000

function pyvenv() {
    if [ -z "$1" ]; then
        echo "Usage:"
        echo "    pyvenv activate <name> - activate <name> virtual environment"
        echo "    pyvenv create <name>   - create a new virtual environment in directory <name>"
        echo "    pyvenv delete <name>   - delete <name> virtual environment"
        echo "    pyvenv list            - list all the available virtual environments"
        echo "    pyvenv help            - print this help message"
    else
        case "$1" in
            "activate")
                if [[ -e "$PYTHON_VENV_HOME/$2" && -d "$PYTHON_VENV_HOME/$2" ]]; then
                    echo "Activating virtual environment <$2>..."
                    source "$PYTHON_VENV_HOME/$2/bin/activate"

                    if [ "$?" -eq 0 ]; then
                        echo "Done"
                    else
                        echo "Failed"
                        return 1
                    fi
                else
                    echo "Virtual environment <$2> does not exist"
                    return 1
                fi
                ;;
            "create")
                if [[ -e "$PYTHON_VENV_HOME" && -d "$PYTHON_VENV_HOME" ]]; then
                    echo "Creating virtual environment <$2>"
                    virtualenv "$PYTHON_VENV_HOME/$2"

                    if [ "$?" -eq 0 ]; then
                        echo "Done"
                    else
                        echo "Failed"
                        return 1
                    fi
                fi
                ;;
            "delete")
                if [[ -e "$PYTHON_VENV_HOME/$2" && -d "$PYTHON_VENV_HOME/$2" ]]; then
                    echo "Deleting virtual environment <$2>"
                    rm -rf "$PYTHON_VENV_HOME/$2"

                    if [ "$?" -eq 0 ]; then
                        echo "Done"
                    else
                        echo "Failed"
                        return 1
                    fi
                else
                    echo "Virtual environment <$2> does not exist"
                    return 1
                fi
                ;;
            "list")
                if [[ -e "$PYTHON_VENV_HOME" && -d "$PYTHON_VENV_HOME" ]]; then
                    virtual_envs=(`ls $PYTHON_VENV_HOME`)

                    echo "Available virtual environments:"

                    for env in ${virtual_envs[*]}; do
                        echo "    $env"
                    done
                else
                    echo "PYTHON_VENV_HOME does not exist, is not a directory, or unset"
                    return 1
                fi
                ;;
            *)
                echo "Unrecognized command \"$1\""
                return 1
                ;;
        esac
    fi
}

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
