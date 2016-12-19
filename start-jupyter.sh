#!/bin/bash
JUPYTER_VENV_DIR=$HOME/jupyter-virtualenv
JUPYTER_VENV_DATA_DIR=$JUPYTER_VENV_DIR/data

source $JUPYTER_VENV_DIR/venv/bin/activate
cd $JUPYTER_VENV_DATA_DIR

echo "Setting theme..."
jt -f inputmono -fs 10 -nf opensans -nfs 12 -tf rasaserif -tfs 14 -vim -t grade3 -cellw 1100

echo "Applying [fulhack] colorfix..."
sed -i.bak 's/efefef/f8f8f8/g' ~/.jupyter/custom/custom.css

echo "Starting Jupyter..."
jupyter notebook --ip='*' --no-browser --NotebookApp.token=''
