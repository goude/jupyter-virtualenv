#!/bin/bash

#export PATH="$HOME/.pyenv/bin:$PATH"
#eval "$(pyenv init -)"
#eval "$(pyenv virtualenv-init -)"

source "$HOME/.homesick/repos/runcom/localenv"
$RUNCOM_PIPENV_CMD --python 3

$RUNCOM_PIPENV_CMD install --skip-lock \
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
tornado==5.1.* \
pandas

$RUNCOM_PIPENV_CMD run jupyter serverextension enable --py jupyterlab --sys-prefix
$RUNCOM_PIPENV_CMD run jupyter labextension install jupyterlab_vim
