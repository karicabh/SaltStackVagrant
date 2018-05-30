install_docker-compose:
  pkg.installed:
    - pkgs:
      - docker-compose

gen_docker-compose:
  file.managed:
    - name: /srv/salt/dockerfiles/mysql/docker-compose.yml
    - source: /srv/salt/dockerfiles/mysql/docker-compose.jinja
    - template: jinja
    - user: root
    - group: root
    - mode: 644

start_mysql:
  cmd.run:
    - name: docker-compose up -d
    - cwd: /srv/salt/dockerfiles/mysql/
  require:
    - pkg.installed: install_docker-compose
    - file.managed: gen_docker-compose
