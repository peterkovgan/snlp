# Spark Python template


MY Comments first:

Commands that I used to install the images of the master and worker and the app:

docker run --network nlpnetwork --name spark-master -h spark-master -e ENABLE_INIT_DAEMON=false -d bde2020/spark-master:2.4.0-hadoop2.7

docker run --network nlpnetwork --name spark-worker-1 --link spark-master:spark-master -e ENABLE_INIT_DAEMON=false -d bde2020/spark-worker:2.4.0-hadoop2.7

docker build --rm -t bde/spark-app-nlp .

docker run  --network nlpnetwork  --name my-spark-app-nlp -e ENABLE_INIT_DAEMON=false --link spark-master:spark-master -d bde/spark-app-nlp




The Spark Python template image serves as a base image to build your own Python application to run on a Spark cluster. See [big-data-europe/docker-spark README](https://github.com/big-data-europe/docker-spark) for a description how to setup a Spark cluster.

### Package your application using pip
You can build and launch your Python application on a Spark cluster by extending this image with your sources. The template uses [pip](https://pip.pypa.io/en/stable/) to manage the dependencies of your
project, so make sure you have a `requirements.txt` file in the root of your application specifying all the dependencies.

### Extending the Spark Python template with your application

#### Steps to extend the Spark Python template
1. Create a Dockerfile in the root folder of your project (which also contains a `requirements.txt`)
2. Extend the Spark Python template Docker image
3. Configure the following environment variables (unless the default value satisfies):
  * `SPARK_MASTER_NAME` (default: spark-master)
  * `SPARK_MASTER_PORT` (default: 7077)
  * `SPARK_APPLICATION_PYTHON_LOCATION` (default: /app/app.py)
  * `SPARK_APPLICATION_ARGS`
4. Build and run the image
```
docker build --rm -t bde/spark-app .
docker run --name my-spark-app --link spark-master:spark-master -d bde/spark-app
```

The sources in the project folder will be automatically added to `/app` if you directly extend the Spark Python template image. Otherwise you will have to add the sources by yourself in your Dockerfile with the command:

    COPY . /app

If you overwrite the template's `CMD` in your Dockerfile, make sure to execute the `/template.sh` script at the end.

#### Example Dockerfile
```
FROM bde2020/spark-python-template:2.4.0-hadoop2.7

MAINTAINER You <you@example.org>

ENV SPARK_APPLICATION_PYTHON_LOCATION /app/entrypoint.py
ENV SPARK_APPLICATION_ARGS "foo bar baz"
```

#### Example application
Coming soon
