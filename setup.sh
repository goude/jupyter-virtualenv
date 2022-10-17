#!/bin/bash

echo "Setting up jupyterlab - did you remember to nvm use node?"

python3 -m venv jupyter-venv
source jupyter-venv/bin/activate

PIP_CMD="pip3 --no-cache-dir install --upgrade"
#$PIP_CMD pip==18.1
$PIP_CMD pip wheel
$PIP_CMD $(cat packages)

jupyter labextension install @axlair/jupyterlab_vim

jupyter labextension install @ryantam626/jupyterlab_code_formatter
$PIP_CMD jupyterlab_code_formatter
jupyter serverextension enable --py jupyterlab_code_formatter
