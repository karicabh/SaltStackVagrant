epelrel:
  pkg.installed:
    - pkgs:
      - epel-release

docker-engine:
  pkg.installed:
    - pkgs: 
      - python-devel
      - yum-utils
      - python2-pip
      - device-mapper-persistent-data
      - lvm2
    - require:
      - pkg: epelrel

dockerrepo:
  require:
    - pkg: docker-engine
  cmd.run:
    - name: yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
  pkg.installed:
    - pkgs:
      - docker-ce


pippkginstall:
  pip.installed:
    - name: docker-py

docker:
  service.running:
    - enable: True
