#!/bin/bash

# See http://bikulov.org/blog/2015/11/07/install-jupyter-notebook-and-scientific-environment-in-ubuntu-14-dot-04-with-python-3/

pyvenv venv

source venv/bin/activate

npm install -g configurable-http-proxy

pip3 install numpy
pip3 install sympy scipy seaborn pandas jupyter
pip3 install bokeh
pip3 install scikit-learn
pip3 install jupyterhub

deactivate
