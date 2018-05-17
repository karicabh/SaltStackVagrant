build:
  require:
    - sls: docker-engine
  docker_image.present:
    - build: /srv/salt/dockerfiles/build/
    - name: karic/build
    - tag: latest

runbuild:
  require:
    - docker_image.present: karic/build
  docker_container.run:
    - image: karic/build
    - replace: True
    - binds: 
      - /srv/salt/artifact/:/data/
      - /srv/m2/:/root/.m2/
