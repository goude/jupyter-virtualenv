#!/bin/bash

#export PATH="$HOME/.pyenv/bin:$PATH"
#eval "$(pyenv init -)"
#eval "$(pyenv virtualenv-init -)"

source "$HOME/.homesick/repos/runcom/localenv"
$RUNCOM_PIPENV_CMD --python 3
$RUNCOM_PIPENV_CMD install --skip-lock $(cat packages)
#$RUNCOM_PIPENV_CMD run jupyter serverextension enable --py jupyterlab --sys-prefix
$RUNCOM_PIPENV_CMD run jupyter labextension install jupyterlab_vim
