# create env
conda create -n deeplearn

# install python 3.7
conda install python=3.7

# install pytorch
conda install -c pytorch pytorch==1.11.0

# install tensorflow
# conda install -c anaconda tensorflow
pip install tensorflow==2.9.0

# install huggingface transformers
conda install -c huggingface transformers==4.19.4
