#!/bin/bash
#JUPYTER_VENV_DIR=$HOME/jupyter-virtualenv
#JUPYTER_VENV_DATA_DIR=$JUPYTER_VENV_DIR/data
JUPYTER_VENV_DATA_DIR=./data

#source $JUPYTER_VENV_DIR/venv/bin/activate
eval "$(pyenv init -)"
pyenv activate pyenv-jupyter

cd $JUPYTER_VENV_DATA_DIR

echo "Please specify a new password for this Jupyter session."
jupyterpwd="$(python -c 'from IPython.lib import passwd; print(passwd());')"

jt -r # reset jt

# Simple check: if any arguments, launch Notebook in vim mode.
if [ $# -ne 0 ]
  then
    echo "Enabling vim key bindings..."
    jupyter nbextension enable vim_binding/vim_binding --sys-prefix

    echo "Setting theme..."
    jt -f inputmono -fs 10 -nf opensans -nfs 12 -tf rasaserif -tfs 14 -vim -t grade3 -cellw 1100

    echo "Applying [fulhack] colorfix..."
    sed -i.bak 's/efefef/f8f8f8/g' ~/.jupyter/custom/custom.css
fi

echo "Starting Jupyter..."
jupyter notebook --ip='*' --no-browser --NotebookApp.password="$jupyterpwd"
