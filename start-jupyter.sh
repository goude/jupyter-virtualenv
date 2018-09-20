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

echo "Please specify a new password for this Jupyter session."
jupyterpwd="$(python -c 'from notebook.auth import passwd; print(passwd());')"

jt -r # reset jt

# Simple check: if any arguments, launch Notebook in vim mode.
if [ $# -ne 0 ]
  then
    echo "Enabling vim key bindings..."
    jupyter nbextension enable vim_binding/vim_binding --sys-prefix

    echo "Setting theme..."
    #jt -f firacode -fs 12 -nf robotosans -nfs 12 -tf loraserif -tfs 14 -vim -t grade3 -cellw 1100
    jt -vim -t grade3 -f firacode -fs 10 -tfs 9 -nfs 9 -dfs 9 -ofs 9 -cellw 95%

    echo "Applying [fulhack] colorfix..."
    sed -i.bak 's/efefef/f8f8f8/g' ~/.jupyter/custom/custom.css
fi

echo "Starting Jupyter..."
jupyter notebook --ip='0.0.0.0' --no-browser --NotebookApp.password="$jupyterpwd"
