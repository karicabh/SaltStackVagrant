gen_petclinic_artifact:
  docker_container.run:
    - image: karic/mvn
    - command:  /usr/share/app/build_artifact.sh
    - replace: True
    - binds: 
      - /srv/salt/artifact/:/data/
      - /srv/m2/:/root/.m2/
  require:
    - docker_image.present: karic/mvn

relocate_artifcat:
  cmd.run:
    - name: cp /srv/salt/artifact/spring-petclinic-2.0.0.BUILD-SNAPSHOT.jar /srv/salt/dockerfiles/run/spring-petclinic-2.0.0.BUILD-SNAPSHOT.jar

build_run_container:
  docker_image.present:
    - build: /srv/salt/dockerfiles/run/
    - name: karic/petclinic_run
    - tag: latest

push_karic/petclinic_run:
  module.run:
    - name: docker.push
    - image: karic/petclinic_run
