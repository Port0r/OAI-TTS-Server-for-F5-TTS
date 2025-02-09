#!/bin/bash

#SETUP
F5_DIR="/home/porter/miniconda3/envs/f5-tts/"


# Check if argument is provided
if [ -z "$1" ]
then
    echo "No language supplied."
    LANGUAGE='en'
fi

# Check if argument is provided
if [ -z "$2" ]
then
    echo "No voice name supplied."
    VOICE='Her'
else
    VOICE="$2"
fi

# Assign the argument to a variable based on your specifications
echo "LANGUAGE $1"
echo "VOICE $2"
case $1 in
    'de')
        LANGUAGE='de-DE'
        ;;
    'en')
        LANGUAGE='en-US'
        ;;
    'it')
        LANGUAGE='it-IT'
        ;;
    *)
        echo "Using en-US."
        LANGUAGE='en-US'
	#exit;
        ;;
esac


TORCH_ROCM_AOTRITON_ENABLE_EXPERIMENTAL=1 python ../F5-TTS/src/f5_tts/infer/infer_cli.py -c "${F5_DIR}${VOICE}.toml" --load_vocoder_from_local --skip_audio_conversion
