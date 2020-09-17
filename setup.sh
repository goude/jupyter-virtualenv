#!/bin/bash

echo "Setting up jupyterlab - did you remember to nvm use node?"

# Sources
# - http://bikulov.org/blog/2015/11/07/install-jupyter-notebook-and-scientific-environment-in-ubuntu-14-dot-04-with-python-3/

export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

#source "$HOME/.homesick/repos/runcom/localenv"
pyenv install --skip-existing 3.7.9
pyenv virtualenv-delete --force pyenv-jupyter
#pyenv virtualenv system pyenv-jupyter
pyenv virtualenv 3.7.9 pyenv-jupyter

pyenv activate pyenv-jupyter

PIP_CMD="pip3 --no-cache-dir install --upgrade"
#$PIP_CMD pip==18.1
$PIP_CMD pip wheel
$PIP_CMD $(cat packages)

# Important: rehash pyenv to make jupyter command available
pyenv rehash

#jupyter serverextension enable --py jupyterlab --sys-prefix
jupyter labextension install @axlair/jupyterlab_vim

jupyter labextension install @ryantam626/jupyterlab_code_formatter
$PIP_CMD jupyterlab_code_formatter
jupyter serverextension enable --py jupyterlab_code_formatter

pyenv rehash
pyenv deactivate
