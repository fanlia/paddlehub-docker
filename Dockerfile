FROM paddlepaddle/paddle:2.4.2

RUN pip install paddlehub -i https://mirror.baidu.com/pypi/simple

RUN pip install flask flask_cors -i https://mirror.baidu.com/pypi/simple

RUN pip install shapely pyclipper -i https://mirror.baidu.com/pypi/simple
RUN hub install ch_pp-ocrv3 ch_pp-ocrv3_det
WORKDIR /code

COPY . .

EXPOSE 5000

CMD ["python", "app.py"]
