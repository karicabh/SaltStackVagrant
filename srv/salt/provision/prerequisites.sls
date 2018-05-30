install_epel_release:
  pkg.installed:
    - pkgs:
      - epel-release

install_prerequisites:
  pkg.installed:
    - pkgs: 
      - python-devel
      - yum-utils
      - python2-pip
      - device-mapper-persistent-data
      - lvm2
    - require:
      - pkg: install_epel_release

add_docker_ce_repo:
  cmd.run:
    - name: yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
  require:
    - pkg: install_prerequisites

install_docker_ce:
  pkg.installed:
    - pkgs:
      - docker-ce
  require:
    - cmd: add_docker_ce_repo


install_docker_py_pip:
  pip.installed:
    - name: docker-py
  require:
    - pkg: install_prerequisites

enable_docker_service:
  service.running:
    - name: docker
    - enable: True
  require:
    - pip.installed: install_docker_py_pip
