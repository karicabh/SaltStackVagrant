FROM ubuntu:16.04
RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install git openjdk-8-jdk -y
RUN apt-get clean
RUN rm -rf /var/cache/apt/archives
