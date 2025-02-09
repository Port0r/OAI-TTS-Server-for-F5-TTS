
from flask import Flask, request, send_file, jsonify
import torch
from transformers import pipeline
import os
import json
import base64
app = Flask(__name__)


@app.route('/v1/audio/speech', methods=['POST'])
def speech():
    data = request.get_json()  # Get the JSON input from the POST request
    text = data['input']  # Extract the 'input' field 
    voice = data['voice']  # Extract the 'voice' field 
    
    with open('../textfile.txt', 'w') as f:  # Write the extracted text to a file
        text.replace(":", ".")
        text.replace("!", ".")
        text.replace("]:", "]")
        f.write(text)
        
    os.system(f"./tts.sh en " + voice)
    
    return send_file('../output.wav', mimetype='audio/x-wav')  # Return the audio file in the HTTP response


if __name__ == '__main__':
    app.run(port=5000, host="0.0.0.0")
    app.config['UPLOAD_FOLDER'] = '.'
