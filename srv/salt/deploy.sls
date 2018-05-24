{% set hostname = salt['grains.get']('host', '') %}
{% if hostname == 'web-minion' %}
karic/petclinic_run:
  docker_image.present:
    - tag: latest
    - force: True
run_karic/petclinic_run:
  docker_container.running:
    - name: petclinic_run
    - image: karic/petclinic_run
    - port_bindings:
      - 8080:{{ pillar['port'] }}
    - replace: True
    - detach: True
  require:
    - docker_image.present: karic/petclinic_run

{% endif %}
{% if hostname == 'master' %}

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

{% endif %}
