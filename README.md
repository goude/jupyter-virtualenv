# jupyter-virtualenv

This is a huge and opinionized docker container for running Jupyter notebooks.

Vim keybindings are available but not enabled by default, see `start-jupyter.sh` for activation instructions.

Usage example:

```sh
docker run \
  -t -i \
  -p 8888:8888 \
  -v $HOME/mynotebooks:/home/runcom/jupyter-virtualenv/data/mynotebooks \
  --name=ephemeric-jupyter-notebook \
  --rm \
  goude/jupyter-virtualenv /home/runcom/jupyter-virtualenv/start-jupyter.sh
```
