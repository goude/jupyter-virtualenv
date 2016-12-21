FROM goude/runcom-linux
MAINTAINER Daniel Goude <daniel@goude.se>

# Bloat it up!
RUN apt-get install -y \
  openjdk-8-jre-headless \
  texlive-xetex

USER runcom
WORKDIR /home/runcom

RUN \
  git clone https://github.com/goude/jupyter-virtualenv.git && \
  cd jupyter-virtualenv && \
  ./setup.sh
