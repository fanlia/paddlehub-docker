FROM paddlepaddle/paddle:2.4.2

RUN pip install paddlehub -i https://mirror.baidu.com/pypi/simple

RUN pip install flask flask_cors -i https://mirror.baidu.com/pypi/simple

RUN pip install shapely pyclipper -i https://mirror.baidu.com/pypi/simple
RUN hub install chinese_ocr_db_crnn_mobile
RUN hub install chinese_text_detection_db_mobile
WORKDIR /code

COPY . .

EXPOSE 5000

CMD ["python", "app.py"]
