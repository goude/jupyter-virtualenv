#!/bin/bash
#source ../venv/bin/activate
source oracle-environment

eval "$(pyenv init -)"
pyenv activate pyenv-jupyter

PIP_CMD="pip3 --no-cache-dir"

# Sorry, but you need to download the installation files manually
sudo alien -i install/oracle-instantclient12.1-basiclite-12.1.0.2.0-1.x86_64.rpm
sudo alien -i install/oracle-instantclient12.1-devel-12.1.0.2.0-1.x86_64.rpm

$PIP_CMD install cx_oracle
