buildmvn:
  docker_image.present:
    - build: /srv/salt/dockerfiles/mvn/
    - name: karic/mvn
    - tag: latest
  require:
    - sls: docker-engine

karic/mvn:
  module.run:
    - name: docker.push
    - image: karic/mvn
