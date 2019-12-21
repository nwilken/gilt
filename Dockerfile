FROM python:3.8

RUN pip install python-gilt && \
    rm -rf /root/.cache/pip
