docker-engine:
  pkg.installed:
    - pkgs: 
      - docker
docker:
  service.running:
    - enable: True
