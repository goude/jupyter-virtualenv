#!/bin/bash
eval "$(pyenv init -)"
pyenv activate pyenv-jupyter

pip3 install -i https://pypi.anaconda.org/OpenEye/simple OpenEye-toolkits
oecheminfo.py
