#!/bin/bash

# Sources
# - http://bikulov.org/blog/2015/11/07/install-jupyter-notebook-and-scientific-environment-in-ubuntu-14-dot-04-with-python-3/

export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

source "$HOME/.homesick/repos/runcom/localenv"
pyenv install --skip-existing 3.6.6
pyenv virtualenv-delete --force pyenv-jupyter
pyenv virtualenv 3.6.6 pyenv-jupyter
pyenv activate pyenv-jupyter

PIP_CMD="pip3 --no-cache-dir install --upgrade"
$PIP_CMD pip==18.1

$PIP_CMD \
jaydebeapi \
jupyterlab \
psycopg2-binary \
requests \
seaborn \
openpyxl \
xlrd \
tqdm \
sas7bdat \
sqlalchemy \
scikit-learn \
nltk \
tornado=5.1.1 \
pandas

# Important: rehash pyenv to make jupyter command available
pyenv rehash

jupyter serverextension enable --py jupyterlab --sys-prefix
#jupyter labextension install jupyterlab_vim

pyenv rehash
pyenv deactivate
