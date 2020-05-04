#!/bin/bash

#-----------------------------
# Python
#-----------------------------

sudo apt-get install -y \
    python \
    python-dev \
    python-pip \
    python-setuptools

#-----------------------------
# pyenv
# https://github.com/yyuu/pyenv
#-----------------------------

mkdir -p ~/work/software/archives

cd ~/work/software/archives

git clone https://github.com/yyuu/pyenv.git ~/.pyenv

echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bash_profile

echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bash_profile

echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.bash_profile

# In a non-interactive install, you can't do this:
# exec "$SHELL"
# and so you need to mock this:

export PYENV_ROOT="$HOME/.pyenv"

export PATH="$PYENV_ROOT/bin:$PATH"

eval "$(pyenv init -)"

pyenv install 3.8.2

pyenv shell 3.8.2

pip install --upgrade \
    pip \
    setuptools \
    wheel

#-----------------------------
# pe2loaddata
#-----------------------------

# This section will go once pe2loaddata is packaged

pip install --upgrade \
    IPython \
    pyyaml

#-----------------------------
# NOTE:
# DCP and cytominer are configured within this script because
# pyenv wouldn't load when they were moved into their own scripts
#-----------------------------

#-----------------------------
# DCP Control Node
# https://github.com/CellProfiler/Distributed-CellProfiler/wiki/Before-you-get-started%3A-setting-up
#-----------------------------

# This is done in tools.sh
# sudo apt install build-essential checkinstall
# sudo apt-get install parallel

# This is done above
# sudo apt install python python-dev python-setuptools python-dev build-essential
# pip install --upgrade setuptools

# This is no longer needed
# See https://pip.pypa.io/en/stable/installing/
# sudo easy_install pip

sudo apt-get install -y \
    cloud-image-utils \
    fabric

cd ~

git clone https://github.com/CellProfiler/Distributed-CellProfiler.git

cd Distributed-CellProfiler/files

pyenv local 3.8.2

pyenv shell 3.8.2

pip install -r requirements.txt

pip install --upgrade \
    awscli

#-----------------------------
# cytominer
#-----------------------------

pip install cytominer-database==0.3.3

