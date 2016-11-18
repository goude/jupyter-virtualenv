#!/bin/bash

# See http://bikulov.org/blog/2015/11/07/install-jupyter-notebook-and-scientific-environment-in-ubuntu-14-dot-04-with-python-3/

pyvenv venv

source venv/bin/activate

pip install numpy
pip install sympy scipy seaborn pandas jupyter
pip install scikit-learn

deactivate
