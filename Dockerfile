FROM goude/runcom-linux
MAINTAINER Daniel Goude <daniel@goude.se>

USER runcom
WORKDIR /home/runcom

RUN \
  git clone https://github.com/goude/jupyter-virtualenv.git && \
  cd jupyter-virtualenv && \
  jupyter-virtualenv/setup.sh
