# Create new environment
CONDA_SUBDIR=osx-arm64 conda create -n ml python=3.9 anaconda -c conda-forge
conda env config vars set CONDA_SUBDIR=osx-arm64
# Switch to new environment
conda activate ml
# PyTorch Installation
pip install -U --pre torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/nightly/cpu
# HF transformers and datasets
pip install transformers datasets
# Install Rust in case
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
# sentencepiece dependency
brew install cmake
brew install pkg-config
# install sentence-transformers 
pip install sentence-transformers

# Set up 
conda install -c apple tensorflow-deps
# Install base TensorFlow
python -m pip install tensorflow-macos
# Install tensorflow-metal plug-in
python -m pip install tensorflow-metal

