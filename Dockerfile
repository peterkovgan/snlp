FROM bde2020/spark-python-template:2.4.0-hadoop2.7

MAINTAINER Peter <peter.kovgan@gmail.com>

ENV SPARK_APPLICATION_PYTHON_LOCATION /app/app.py

ENV SPARK_MASTER_NAME spark-master
