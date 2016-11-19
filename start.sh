#!/bin/bash
JUPYTER_VENV_DIR=$HOME/jupyter-virtualenv
JUPYTER_VENV_DATA_DIR=$JUPYTER_VENV_DIR/data

source $JUPYTER_VENV_DIR/venv/bin/activate
cd $JUPYTER_VENV_DATA_DIR

jupyter notebook --ip='*' --no-browser
