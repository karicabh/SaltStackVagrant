git:
  pkg.installed:
    - name: git

git-website:
  git.latest:
    - name: https://github.com/karicabh/SaltStackDeployment.git 
    - depth: 1
    - rev: prebuild
    - target: /usr/share/app
    - require:
      - pkg: git

build:
  require:
    - sls: docker-engine
    - git.lastest: git-website
    - docker_volume.present: datavolume
  docker_image.present:
    - build: /usr/share/app
    - name: karic/spring_clinic_deployment
    - tag: latest

datavolume:
  docker_volume.present:
    - name: data
