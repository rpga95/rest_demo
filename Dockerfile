FROM python:3.7.4-alpine3.9
RUN apk add mariadb-client
RUN apk add build-base
RUN mkdir -p /opt/rest_api/
ADD requirements.txt /opt/rest_api/
RUN pip install -r /opt/rest_api/requirements.txt
ADD python/ /opt/rest_api/
WORKDIR /opt/rest_api
EXPOSE 8000
ENTRYPOINT uvicorn api:app --reload
