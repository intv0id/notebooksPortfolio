#! /bin/bash

pip install grip
# Install miniconda
wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh;
bash miniconda.sh -b -p $HOME/miniconda
export PATH="$HOME/miniconda/bin:$PATH"
hash -r
conda config --set always_yes yes --set changeps1 no
conda update -q conda
# Useful for debugging any issues with conda
conda info -a

# Replace dep1 dep2 ... with your dependencies
conda create -q -n test-environment python=$TRAVIS_PYTHON_VERSION 
source activate test-environment
conda install jupyter
conda install -c conda-forge jupyter_contrib_nbextensions
jupyter contrib nbextension install --user
jupyter nbextension enable toc2/main


(find -type f -iregex .*\.ipynb; find -type f -iregex .*-checkpoint\.ipynb) | 
      sort | 
      uniq -u | 
      xargs jupyter nbconvert --template toc2 --to html --output-dir ghActionPortfolioPublisher


# Generating descriptive homepage
bash ./scripts/description_generator.sh
