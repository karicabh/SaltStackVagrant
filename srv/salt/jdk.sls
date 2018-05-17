buildjdk:
  require:
    - sls: docker-engine
  docker_image.present:
    - build: /srv/salt/dockerfiles/jdk/
    - name: karic/jdk
    - tag: latest

karic/jdk:
  module.run:
    - name: docker.push
    - image: karic/jdk
      
