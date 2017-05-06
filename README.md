# jupyter-virtualenv

This is a huge and opinionized docker container for running Jupyter notebooks.
See `setup.sh` for an idea of what's included out-of-the-box.

Username `runcom`, password `runcom`.

Usage examples:

```sh
$ docker run -t -i -p 8888:8888 -e SHELL=/bin/bash goude/jupyter-virtualenv /bin/bash --login /home/runcom/jupyter-virtualenv/start-jupyter.sh
```

After running one of the above commands, Jupyter will be available at http://localhost:8888

Vim keybindings for Jupyter are available but not enabled by default, see `start-jupyter.sh` for activation instructions.
