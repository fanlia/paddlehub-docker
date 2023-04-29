
from flask import Flask, request, jsonify, render_template
from flask_cors import CORS

import paddlehub as hub
import cv2
import numpy as np

app = Flask(__name__)
CORS(app)
app.config['JSON_AS_ASCII'] = False
app.config['JSONIFY_MIMETYPE'] = "application/json;charset=utf-8"

@app.route("/ocr", methods=['GET', 'POST'])
def ocr_route():
    if request.method == 'POST':
        buf = request.files['file'].read()
        image = np.frombuffer(buf, np.uint8)
        img = cv2.imdecode(image, 1)
        ocr = hub.Module(name="chinese_ocr_db_crnn_mobile", enable_mkldnn=True)
        results = ocr.recognize_text(images=[img])
        result = results[0]['data']

        return jsonify({'result': result})
    else:
        return render_template('upload.html')

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000)
