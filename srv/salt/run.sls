dockerf:
  file.managed:
    - name: /dockerfiles/run/Dockerfile
    - source: salt://dockerfiles/run/Dockerfile
    - backup: minion

artifactf:
  file.managed:
    - name: /srv/artifact/spring-petclinic-2.0.0.BUILD-SNAPSHOT.jar
    - source: salt://srv/artifact/spring-petclinic-2.0.0.BUILD-SNAPSHOT.jar
    - backup: minion


build:
  require:
    - sls: docker-engine
  docker_image.present:
    - build: /srv/salt/dockerfiles/run/
    - name: karic/run
    - tag: latest

runbuild:
  require:
    - docker_image.present: karic/run
  docker_container.run:
    - image: karic/run
    - replace: True
    - detach: True
    - binds: 
      - /srv/artifact/:/data/
