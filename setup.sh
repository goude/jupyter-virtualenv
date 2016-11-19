#!/bin/bash

# See http://bikulov.org/blog/2015/11/07/install-jupyter-notebook-and-scientific-environment-in-ubuntu-14-dot-04-with-python-3/

pyvenv venv

source venv/bin/activate

npm install -g configurable-http-proxy # jupyterhub requirement

pip3 install numpy
pip3 install sympy scipy seaborn pandas jupyter
pip3 install bokeh
pip3 install scikit-learn
pip3 install jupyterhub

# swagger client
pip3 install bravado

# TODO: Using --py and --sys-prefix, due to error message in bokeh example. Check why this is needed.

# interactive widgets, see bokeh example
pip3 install ipywidgets
jupyter nbextension enable --sys-prefix widgetsnbextension

# recommended by vim key bindings for easier setup - https://github.com/ipython-contrib/jupyter_contrib_nbextensions#installation
pip3 install jupyter_contrib_nbextensions
jupyter contrib nbextension install --sys-prefix

pip3 install jupyter_nbextensions_configurator
jupyter nbextensions_configurator enable --sys-prefix

# vim key bindings - https://github.com/lambdalisue/jupyter-vim-binding/wiki/Installation
cd $(jupyter --data-dir)/nbextensions
git clone https://github.com/lambdalisue/jupyter-vim-binding vim_binding
jupyter nbextension enable --sys-prefix vim_binding/vim_binding
cd -
#chmod -R go-w vim_binding

deactivate
