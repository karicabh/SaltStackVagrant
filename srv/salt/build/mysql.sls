build_karic/jdk:
  docker_image.present:
    - build: /srv/salt/dockerfiles/mysql/
    - name: karic/mysql
    - force: True
    - tag: latest

push_karic/jdk:
  module.run:
    - name: docker.push
    - image: karic/mysql
      
