build_karic/mvn:
  docker_image.present:
    - build: /srv/salt/dockerfiles/mvn/
    - force: True
    - name: karic/mvn
    - tag: latest

push_karic/mvn:
  module.run:
    - name: docker.push
    - image: karic/mvn
