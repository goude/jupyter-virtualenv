#!/usr/bin/env bash
source "$HOME/.homesick/repos/runcom/localenv"

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
JUPYTER_VENV_DATA_DIR=$SCRIPT_DIR/data

cd $JUPYTER_VENV_DATA_DIR

echo "Please specify a new password for this Jupyterlab session."
jupyterpwd="$($RUNCOM_PIPENV_CMD run python -c 'from notebook.auth import passwd; print(passwd());')"

echo "Starting Jupyterlab..."
$RUNCOM_PIPENV_CMD run jupyter lab --ip='0.0.0.0' --no-browser --NotebookApp.password="$jupyterpwd"
