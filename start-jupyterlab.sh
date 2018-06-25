#!/usr/bin/env bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
JUPYTER_VENV_DATA_DIR=$SCRIPT_DIR/data

# Test: fix pyenv
if [[ -d $HOME/.pyenv/bin ]]; then
  export PATH="$HOME/.pyenv/bin:$PATH"
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi

#eval "$(pyenv init -)"
pyenv activate pyenv-jupyter

cd $JUPYTER_VENV_DATA_DIR

echo "Please specify a new password for this Jupyterlab session."
jupyterpwd="$(python -c 'from notebook.auth import passwd; print(passwd());')"

echo "Starting Jupyterlab..."
jupyter lab --ip='*' --no-browser --NotebookApp.password="$jupyterpwd"
