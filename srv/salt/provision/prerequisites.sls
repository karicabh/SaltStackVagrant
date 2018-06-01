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



docker_service_down:
  service.dead:
    - enable: False
    - name: docker
  require:
    - pkg: install_docker_ce


/etc/docker/daemon.json:
  file.managed:
    - makedirs: True
    - contents: |
        {
        "storage-driver": "devicemapper"
        }
  require:
    - service: docker_service_down
    - pkg: install_docker_ce




install_docker_py_pip:
  pip.installed:
    - name: docker-py
  require:
    - pkg: install_prerequisites
    - pkg: install_docker_ce


enable_docker_service:
  service.running:
    - name: docker
    - reload: True
    - enable: True
  require:
    - file: /etc/docker/daemon.json
