#!/bin/bash
JUPYTER_VENV_DIR=$HOME/jupyter-virtualenv
JUPYTER_VENV_DATA_DIR=$JUPYTER_VENV_DIR/data

source $JUPYTER_VENV_DIR/venv/bin/activate
cd $JUPYTER_VENV_DATA_DIR

echo "Setting theme..."
jt -f inputmono -fs 12 -nf opensans -tf rasaserif -tfs 18 -vim -t grade3 -cellw 1100

echo "Starting Jupyter..."
jupyter notebook --ip='*' --no-browser
