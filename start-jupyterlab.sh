#!/usr/bin/env bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
JUPYTER_VENV_DATA_DIR=$SCRIPT_DIR/data

source jupyter-venv/bin/activate

cd $JUPYTER_VENV_DATA_DIR

echo "Please specify a new password for this Jupyterlab session."
jupyterpwd="$(python -c 'from notebook.auth import passwd; print(passwd());')"

echo "Starting Jupyterlab..."
jupyter lab --ip='0.0.0.0' --no-browser --NotebookApp.password="$jupyterpwd"
