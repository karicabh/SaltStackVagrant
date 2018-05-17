git:
  pkg.installed:
    - name: git


git-website-deploy:
  git.latest:
    - name: https://github.com/karicabh/SaltStackDeployment.git 
    - depth: 1
    - rev: deploy
    - target: /usr/share/app
    - require:
      - pkg: git

build:
  require:
    - sls: docker-engine
    - git.lastest: git-website-deploy
    - docker_volume.present: datavolume
  docker_image.present:
    - build: /usr/share/app
    - name: karic/spring_clinic_deployment
    - tag: deploy
  docker_container.running:
    - name: petclinic
    - image: karic/spring_clinic_deployment:deploy
    - port_bindings: 8080:8080
