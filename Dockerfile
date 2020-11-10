FROM python:3
ENV PYTHONBUFFERED=1

RUN mkdir /geronimo
WORKDIR /geronimo

COPY requirements.txt /geronimo/
RUN pip install -r requirements.txt

COPY . /geronimo/
