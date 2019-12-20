#pull official base image
FROM python:stretch

LABEL maintainer='Sarah'
LABEL date='2019-12-20'
LABEL description='Image to build the back-end service (Flask) of the Udacity FSND project'

# set work directory
COPY . /app
WORKDIR /app

# set environment variables
ENV PYTHONUNBUFFERED 1 \
    PYTHONDONTWRITEBYTECODE 1 \
    PIP_DEFAULT_TIMEOUT=100 \
    PIP_NO_CACHE_DIR=off

# install dependencies
RUN pip install --upgrade pip
COPY ./requirements.txt /app/requirements.txt
RUN pip install -r requirements.txt

ENTRYPOINT ["gunicorn", "-b", ":8080", "main:APP"]


