if [[ $TERM == dumb ]]; then
    export NODE_NO_READLINE=1
fi

if [[ $OSTYPE == darwin* ]]; then
    export EC2_HOME=~/.ec2
    export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home
    export EDITOR=/usr/local/Cellar/emacs/24.3/bin/emacsclient
    export WORKON_HOME=~/Development/Libraries/python-venv
    export ANDROID_HOME=~/Development/Libraries/android-sdk-macosx
    export PATH=~/bin:${ANDROID_HOME}/platform-tools:${ANDROID_HOME}/tools:${EC2_HOME}/bin:/usr/local/Cellar/ctags/5.8/bin:/usr/local/bin:/usr/local/sbin:${PATH}
    export INFOPATH=/usr/local/share/info/:/usr/local/info/:/usr/local/gnu/info/:/usr/local/gnu/lib/info/:/usr/local/gnu/lib/emacs/info/:/usr/local/emacs/info/:/usr/local/lib/info/:/usr/local/lib/emacs/info/:/usr/share/info/:/usr/local/Cellar/emacs/24.1/share/info/emacs/:/Developer/usr/share/info

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
fi

#export PS1="\[\e[0;34m\][\u@\h \[\e[0;32m\]\W\[\e[0;34m\]]\$(__git_ps1) \[\e[0;33m\]\$\[\e[0m\] "
