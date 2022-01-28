FROM python:3.8.12

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
WORKDIR /code
RUN apt update &&\
    apt install -y tree
COPY ./app/requirements.txt /code/
RUN pip install -r requirements.txt
COPY ./app /code/