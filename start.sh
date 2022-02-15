#!/bin/bash
echo '
# you can deactivate the conda (base) env if thats not the conda you need
cd venv
virtualenv --python=/usr/bin/python3 env <-- not required after 'env' was installed before
source env/bin/activate
cd ..
python3 -m pip install -r requirements.txt
export TORCH_HOME=$(pwd) && export PYTHONPATH=.
# Modify the two files
#Add `device = torch.device("cuda:0" if torch.cuda.is_available() else "cpu")` to two files:
#1. /Users/ginochen/scripts/repo/inpainting_lama_fft/venv/env/lib/python3.9/site-packages/torch/nn/modules/module.py <-- sometimes python3.8
#2. ~/scripts/repo/inpainting_lama_fft/saicinpainting/evaluation/utils.py

# create conda env
cd lama
conda env create -f conda_env.yml
conda activate lama
conda install pytorch torchvision torchaudio cudatoolkit=10.2 -c pytorch -y
pip install pytorch-lightning==1.2.9
'
