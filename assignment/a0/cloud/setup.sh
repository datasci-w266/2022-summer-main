# #!/bin/bash
# 
set -x
# 
# # Don't download stuff to the git repo, that's messy.
pushd ${HOME}
# 
# Update packages
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install bzip2

ANACONDA_INSTALLER="Anaconda3-2021.11-Linux-x86_64.sh"
wget "https://repo.continuum.io/archive/$ANACONDA_INSTALLER"
bash "$ANACONDA_INSTALLER"

source ${HOME}/.bashrc

${HOME}/anaconda3/bin/pip install --upgrade pip
${HOME}/anaconda3/bin/pip install --upgrade tensorflow-cpu==2.8
${HOME}/anaconda3/bin/jupyter notebook --generate-config

# Copy Jupyter config
popd
mkdir ${HOME}/.jupyter
cp -v $(dirname $0)/support/jupyter_notebook_config.py ${HOME}/.jupyter/jupyter_notebook_config.py
