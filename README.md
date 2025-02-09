# OAI-TTS-Server
A simple OpenAI TTS / STT compatible voice server altered to work with F5 TTS.

I use this as interface between Open-WebUI and F5-TTS.

## Usage
I used miniconda to set up the virtual environment:
```
conda create -n f5-tts python=3.10
conda activate f5-tts
```
Install some prerequisits
```
# NVIDIA GPU: install pytorch with your CUDA version, e.g.
pip install torch==2.3.0+cu118 torchaudio==2.3.0+cu118 --extra-index-url https://download.pytorch.org/whl/cu118

# AMD GPU: install pytorch with your ROCm version, e.g. (Linux only)
pip install torch==2.5.1+rocm6.2 torchaudio==2.5.1+rocm6.2 --extra-index-url https://download.pytorch.org/whl/rocm6.2

# Intel GPU: install pytorch with your XPU version, e.g.
# Intel® Deep Learning Essentials or Intel® oneAPI Base Toolkit must be installed
pip install --pre torch torchaudio --index-url https://download.pytorch.org/whl/nightly/xpu
```
In there clone F5-TTS and this repository:
```
cd /miniconda3/envs/f5-tts
git clone https://github.com/Port0r/F5-TTS
cd F5-TTS
# git submodule update --init --recursive  # (optional, if need bigvgan)
pip install -e .

cd ..
git clone https://github.com/Port0r/OAI-TTS-Server-for-F5-TTS.git
cd OAI-TTS-Server-for-F5-TTS
```
Move the demo voice files to the parent directory:
```
mv Her.* ..
```
## Create your own voices

The .toml file contains parameters for F5 TTS regarding this voice, like the name of corresonding .wav file and the transscript. This demo voice was created with the movie Her in mind, where Scarlet Johannson is the voice of an AI.

To add your own voices, you need a short voice sample in .wav format and a .toml file. Just copy and adjust.

## Setup in Open-WebUI

In Open-WebUI you can setup the TTS here: Admin Panel -> Settings -> Audio -> TTS Settings

* Engine is `OpenAI` since this Server is OpenAI compatible 
* URL is `http://0.0.0.0:5000/v1`
* API key can be anything
* Voice corresponds to the name of any .toml file - So you can pick any voice you created right here!
