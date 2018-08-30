#!/bin/bash

# Sources
# - http://bikulov.org/blog/2015/11/07/install-jupyter-notebook-and-scientific-environment-in-ubuntu-14-dot-04-with-python-3/

export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

pyenv virtualenv 3.6.4 pyenv-jupyter
pyenv activate pyenv-jupyter

PIP_CMD="pip3 --no-cache-dir install --upgrade"
$PIP_CMD pip

$PIP_CMD numpy sympy scipy seaborn pandas jupyter \
bokeh scikit-learn \
tensorflow \
yapf \
pillow requests folium sas7bdat geocoder \
pyfiglet matplotlib-venn plotly wordcloud \
nltk vincent pyfiglet jaydebeapi openpyxl \
arrow \
psycopg2-binary \
sqlalchemy lesscpy ipywidgets \
jupyter_nbextensions_configurator jupyter_contrib_nbextensions \
jupyterthemes \
jupyterlab\>=0.33.0,\<0.33.99 \
xlrd \
pandas_datareader \
ipyvolume bqplot ipythonblocks \
jedi flake8 vim-vint yamllint click autopep8 neovim \
qgrid tqdm pytest regex


#bravado # swagger client
#datapackage
#jsontableschema-pandas
#jellyfish # phonetic/approximate string matching
#gensim

$PIP_CMD html5lib

# jupyter stuff
$PIP_CMD bash_kernel
python -m bash_kernel.install

# Important: rehash pyenv to make jupyter command available
pyenv rehash

# interactive widgets, see bokeh example
jupyter nbextension enable --py widgetsnbextension --sys-prefix

# qgrid
jupyter nbextension enable --py --sys-prefix qgrid

# recommended by vim key bindings for easier setup - https://github.com/ipython-contrib/jupyter_contrib_nbextensions#installation
jupyter contrib nbextension install --sys-prefix
jupyter nbextensions_configurator enable --sys-prefix

# alpha version of jupyterlab
jupyter serverextension enable --py jupyterlab --sys-prefix
jupyter labextension install jupyterlab_vim

# vim key bindings - https://github.com/lambdalisue/jupyter-vim-binding/wiki/Installation
# enabled via start script (jupyter nbextension enable vim_binding/vim_binding --sys-prefix)
mkdir -p "$(jupyter --data-dir)/nbextensions"
cd "$(jupyter --data-dir)/nbextensions" || exit
if [ -d vim_binding ]; then
  rm -rf vim_binding
fi
git clone https://github.com/lambdalisue/jupyter-vim-binding vim_binding
cd - || exit

# ...and we're done.
pyenv deactivate
