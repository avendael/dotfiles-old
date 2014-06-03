if [[ $TERM == dumb ]]; then
    export NODE_NO_READLINE=1
fi

if [[ $OSTYPE == darwin* ]]; then
    export DOCKER_HOST=tcp://localhost:4243
    export LC_ALL=en_US.UTF-8
    export LANG=en_US.UTF-8
    export EC2_HOME=~/.ec2
    export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home
    export PROJECTS_HOME=~/Development/Projects
    export EDITOR=/usr/local/bin/emacsclient
    export WORKON_HOME=~/Development/Libraries/python-venv
    export ANDROID_HOME=~/Development/Libraries/android-sdk-macosx
    export MAILDIR_CACHE=~/Library/Caches/OfflineImap
    export NPM_HOME=/usr/local/Cellar/node/`node --version | tr -d 'v'`/lib/node_modules/npm
    export ATOM_REPOS_HOME=~/Development/Projects/atom
    export PATH=~/bin:${ANDROID_HOME}/platform-tools:${ANDROID_HOME}/tools:${EC2_HOME}/bin:/usr/local/Cellar/ctags/5.8/bin:/usr/local/bin:/usr/local/sbin:${PATH}:${NPM_HOME}/bin

    # Include osx specific aliases
    alias ls='ls -G'

    # Include brew bash completion
    if [ -f `brew --prefix`/etc/bash_completion ]; then
        . `brew --prefix`/etc/bash_completion
    else
        echo "No brew completions found"
    fi

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

    # Autojump
    [[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

    # rbenv
    if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
fi

export PS1="\[\e[0;34m\][\u@\h \[\e[0;32m\]\W\[\e[0;34m\]]\$(__git_ps1) \[\e[0;33m\]\$\[\e[0m\] "
