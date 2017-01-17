#!/bin/bash
JUPYTER_VENV_DIR=$HOME/jupyter-virtualenv
JUPYTER_VENV_DATA_DIR=$JUPYTER_VENV_DIR/data

source $JUPYTER_VENV_DIR/venv/bin/activate
cd $JUPYTER_VENV_DATA_DIR

echo "Starting Jupyter..."
jupyter notebook --ip='*' --no-browser --NotebookApp.token=''
