#!/bin/bash

# Sources
# - http://bikulov.org/blog/2015/11/07/install-jupyter-notebook-and-scientific-environment-in-ubuntu-14-dot-04-with-python-3/

export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

pyenv virtualenv 3.6.1 pyenv-jupyter
pyenv activate pyenv-jupyter

PIP_CMD="pip3 --no-cache-dir"
$PIP_CMD install --upgrade pip

$PIP_CMD install numpy sympy scipy seaborn pandas jupyter \
bokeh scikit-learn tensorflow yapf \
pillow requests folium sas7bdat geocoder \
pyfiglet matplotlib-venn plotly wordcloud \
nltk vincent pyfiglet jaydebeapi openpyxl \
arrow psycopg2 sqlalchemy lesscpy ipywidgets \
jupyter_nbextensions_configurator jupyter_contrib_nbextensions \
jupyterthemes jupyterlab

#$PIP_CMD install bravado # swagger client
#$PIP_CMD install datapackage
#$PIP_CMD install pandas_datareader
#$PIP_CMD install jsontableschema-pandas
#$PIP_CMD install jellyfish # phonetic/approximate string matching
#$PIP_CMD install gensim

# jupyter stuff
$PIP_CMD install bash_kernel
python -m bash_kernel.install

# Important: rehash pyenv to make jupyter command available
pyenv rehash

# interactive widgets, see bokeh example
jupyter nbextension enable --py widgetsnbextension --sys-prefix

# recommended by vim key bindings for easier setup - https://github.com/ipython-contrib/jupyter_contrib_nbextensions#installation
jupyter contrib nbextension install --sys-prefix
jupyter nbextensions_configurator enable --sys-prefix

# alpha version of jupyterlab
jupyter serverextension enable --py jupyterlab --sys-prefix

# vim key bindings - https://github.com/lambdalisue/jupyter-vim-binding/wiki/Installation
mkdir -p "$(jupyter --data-dir)/nbextensions"
cd "$(jupyter --data-dir)/nbextensions" || exit
git clone https://github.com/lambdalisue/jupyter-vim-binding vim_binding
# vim key bindings now enabled via start script
#jupyter nbextension enable vim_binding/vim_binding --sys-prefix

# Note: must cd back if more stuff added below!

# ...and we're done.
pyenv deactivate
