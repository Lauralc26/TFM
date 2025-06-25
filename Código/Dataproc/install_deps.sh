# Script de inicializacion -> install_deps.sh
# !/bin/bash
set -e

# Actualizamos apt y pip
apt-get update -y
apt-get install -y python3-pip

# Actualizar pip
pip3 install --upgrade pip

pip install --upgrade pip setuptools
pip install packaging==21.3 --force-reinstall

# Instalamos versiones compatibles de dependencias base
pip3 install --no-cache-dir \
  numpy==1.23.5 \
  pandas \
  scikit-learn \
  psutil \
  tqdm

export CUDA_VISIBLE_DEVICES=""
# TensorFlow CPU version, al ser más estable en Dataproc sin GPU
pip3 install --no-cache-dir tensorflow==2.12.0

# PyTorch CPU version
pip3 install --no-cache-dir torch==2.0.1 torchvision==0.15.2

# Transformers y Hugging Face
pip3 install --no-cache-dir transformers==4.31.0 \
  sentencepiece \
  accelerate \
  huggingface-hub \
  protobuf==3.20.3 

# # Spark si lo necesitas localmente
# pip3 install --no-cache-dir pyspark==3.5.0

# Otros paquetes necesarios
pip3 install pandas requests
