FROM openjdk:11-jdk-slim-buster

ENV TZ=America/Lima
ENV APP_HOME=/app
ENV APP_JAR_NAME=app.jar
ENV APP_JAR_FILE=$APP_HOME/$APP_JAR_NAME

WORKDIR ${APP_HOME}

COPY "./target/api-product-1.0.jar" ${APP_JAR_FILE}

ENTRYPOINT java -jar $APP_JAR_NAME