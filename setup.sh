#! /bin/bash

pip install grip

conda create -q -n htmlgenerationenv python=3.8
source activate htmlgenerationenv

conda install jupyter
conda install -c conda-forge jupyter_contrib_nbextensions
jupyter contrib nbextension install --user
jupyter nbextension enable toc2/main
