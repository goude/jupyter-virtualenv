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

# bqplot ipythonblocks \
##sympy \
#arrow \
#autopep8 \
#bokeh \
#click \
#flake8 \
#folium \
#geocoder \
#ipyvolume \
#ipywidgets \
#jedi \
#jupyter \
#jupyter_contrib_nbextensions \
#jupyter_nbextensions_configurator \
#jupyterlab\>=0.33.0,\<0.33.99 \
#jupyterthemes \
#keras \
#lesscpy \
#matplotlib-venn \
#neovim \
#nltk \
#numpy \
#openpyxl \
#pandas \
#pandas_datareader \
#pillow \
#plotly \
#pyfiglet \
#pytest \
#qgrid \
#regex \
#sas7bdat \
#scikit-learn \
#scipy \
#sqlalchemy \
#tensorflow \
#tqdm \
#vim-vint \
#vincent \
#wordcloud \
#xlrd \
#yamllint \
#yapf

$PIP_CMD \
jaydebeapi \
jupyterlab \
psycopg2-binary \
requests \
seaborn \
pandas

#bravado # swagger client
#datapackage
#jsontableschema-pandas
#jellyfish # phonetic/approximate string matching
#gensim

#$PIP_CMD html5lib

# jupyter stuff
#$PIP_CMD bash_kernel
#python -m bash_kernel.install

# Important: rehash pyenv to make jupyter command available
pyenv rehash

# interactive widgets, see bokeh example
#jupyter nbextension enable --py widgetsnbextension --sys-prefix

# qgrid
#jupyter nbextension enable --py --sys-prefix qgrid

# recommended by vim key bindings for easier setup - https://github.com/ipython-contrib/jupyter_contrib_nbextensions#installation
#jupyter contrib nbextension install --sys-prefix
#jupyter nbextensions_configurator enable --sys-prefix

# alpha version of jupyterlab
jupyter serverextension enable --py jupyterlab --sys-prefix

jupyter labextension install jupyterlab_vim

#jupyter labextension install @mflevine/jupyterlab_html
#jupyter labextension install @jupyterlab/latex
#jupyter labextension install @jpmorganchase/perspective-jupyterlab
#jupyter labextension install @jupyter-widgets/jupyterlab-manager
#jupyter labextension install @jupyterlab/plotly-extension
#jupyter labextension install ipysheet
#jupyter labextension install jupyterlab-drawio
#jupyter labextension install jupyterlab-flake8
#jupyter labextension install jupyterlab_bokeh
#jupyter labextension install lineup_widget
#jupyter labextension install plotlywidget
#jupyter labextension install qgrid

#$PIP_CMD pylantern
#jupyter labextension install pylantern
#jupyter serverextension enable --py lantern

#$PIP_CMD jupyterlab-git
#jupyter labextension install @jupyterlab/git
#jupyter serverextension enable --py jupyterlab_git

#$PIP_CMD jupyterlab-discovery


# vim key bindings - https://github.com/lambdalisue/jupyter-vim-binding/wiki/Installation
# enabled via start script (jupyter nbextension enable vim_binding/vim_binding --sys-prefix)
#mkdir -p "$(jupyter --data-dir)/nbextensions"
#cd "$(jupyter --data-dir)/nbextensions" || exit
#if [ -d vim_binding ]; then
  #rm -rf vim_binding
#fi
#git clone https://github.com/lambdalisue/jupyter-vim-binding vim_binding
#cd - || exit

# ...and we're done.
pyenv rehash
pyenv deactivate
