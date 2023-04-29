FROM paddlepaddle/paddle:2.4.2

RUN pip install paddlehub -i https://mirror.baidu.com/pypi/simple

EXPOSE 8866
