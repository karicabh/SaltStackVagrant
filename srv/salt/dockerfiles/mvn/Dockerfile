FROM karic/jdk
RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install git maven -y
RUN apt-get clean
RUN rm -rf /var/cache/apt/archives
ADD ./mysql/* /usr/src/petclinic/
ADD ./build_artifact.sh /usr/src/petclinic/
