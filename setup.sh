#!/bin/bash

# See http://bikulov.org/blog/2015/11/07/install-jupyter-notebook-and-scientific-environment-in-ubuntu-14-dot-04-with-python-3/

pyvenv venv

source venv/bin/activate

PIP_CMD="$PIP_CMD --no-cache-dir"

$PIP_CMD install --upgrade pip

npm install -g configurable-http-proxy # jupyterhub requirement

$PIP_CMD install numpy
$PIP_CMD install sympy scipy seaborn pandas jupyter
$PIP_CMD install bokeh
$PIP_CMD install scikit-learn
$PIP_CMD install jupyterhub

# swagger client
$PIP_CMD install bravado

# interactive widgets, see bokeh example
$PIP_CMD install ipywidgets
jupyter nbextension enable --py widgetsnbextension --sys-prefix

# recommended by vim key bindings for easier setup - https://github.com/ipython-contrib/jupyter_contrib_nbextensions#installation
$PIP_CMD install jupyter_contrib_nbextensions
jupyter contrib nbextension install --sys-prefix

$PIP_CMD install jupyter_nbextensions_configurator
jupyter nbextensions_configurator enable --sys-prefix

# vim key bindings - https://github.com/lambdalisue/jupyter-vim-binding/wiki/Installation
mkdir -p $(jupyter --data-dir)/nbextensions
cd $(jupyter --data-dir)/nbextensions
git clone https://github.com/lambdalisue/jupyter-vim-binding vim_binding

deactivate
