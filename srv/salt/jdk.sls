build_karic/jdk:
  docker_image.present:
    - build: /srv/salt/dockerfiles/jdk/
    - name: karic/jdk
    - tag: latest

push_karic/jdk:
  module.run:
    - name: docker.push
    - image: karic/jdk
      
