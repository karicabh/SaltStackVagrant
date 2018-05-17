buildmvn:
  require:
    - sls: docker-engine
  docker_image.present:
    - build: /srv/salt/dockerfiles/mvn/
    - name: karic/mvn
    - tag: latest

karic/mvn:
  module.run:
    - name: docker.push
    - image: karic/mvn
