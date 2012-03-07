EMACS=emacs
PYTHON_VENV_HOME=~/Development/Libraries/python-venv
PATH=~/bin:/usr/local/Cellar/ctags/5.8/bin:/usr/local/bin:/usr/local/sbin:$PATH

function pyvenv() {
    if [ -z "$1" ]; then
        echo "Usage:"
        echo "    pyvenv activate <name> - activate <name> virtual environment"
        echo "    pyvenv create <name>   - create a new virtual environment in directory <name>"
        echo "    pyvenv delete <name>   - delete <name> virtual environment"
        echo "    pyvenv help            - print this help message"
    else
        case "$1" in
            "activate")
                if [[ -e "$PYTHON_VENV_HOME/$2" && -d "$PYTHON_VENV_HOME/$2" ]]; then
                    echo "Activating virtual environment <$2>..."
                    source "$PYTHON_VENV_HOME/$2/bin/activate"

                    if [ "$?" -eq 0 ]; then
                        echo "Done"
                    fi
                else
                    echo "Virtual environment <$2> does not exist"
                fi
                ;;
            "create")
                if [[ -e "$PYTHON_VENV_HOME" && -d "$PYTHON_VENV_HOME" ]]; then
                    echo "Creating virtual environment <$2>"
                    virtualenv "$PYTHON_VENV_HOME/$2"

                    if [ "$?" -eq 0 ]; then
                        echo "Done"
                    fi
                fi
                ;;
            "delete")
                if [[ -e "$PYTHON_VENV_HOME/$2" && -d "$PYTHON_VENV_HOME/$2" ]]; then
                    echo "Deleting virtual environment <$2>"
                    rm -rf "$PYTHON_VENV_HOME/$2"

                    if [ "$?" -eq 0 ]; then
                        echo "Done"
                    fi
                fi
                ;;
            *)
                echo "Unrecognized command \"$1\""
                exit 0
                ;;
        esac
    fi
}
