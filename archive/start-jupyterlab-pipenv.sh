#!/usr/bin/env bash
source "$HOME/.homesick/repos/runcom/localenv"
#source "$HOME/.homesick/repos/runcom/rc.pyenv"

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

python_cmd=$($RUNCOM_PIPENV_CMD run pyenv which python)
jupyter_cmd=$($RUNCOM_PIPENV_CMD run pyenv which jupyter)

echo "Please specify a new password for this Jupyterlab session."
jupyterpwd="$($python_cmd -c 'from notebook.auth import passwd; print(passwd());')"

JUPYTER_VENV_DATA_DIR=$SCRIPT_DIR/data
cd $JUPYTER_VENV_DATA_DIR

echo "Starting Jupyterlab..."
$jupyter_cmd lab --ip='0.0.0.0' --no-browser --NotebookApp.password="$jupyterpwd"
