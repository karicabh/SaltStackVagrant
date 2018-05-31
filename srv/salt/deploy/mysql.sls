karic/mysql:
  docker_image.present:
    - tag: latest
    - force: True
run_karic/mysql:
  docker_container.running:
    - name: mysql
    - image: karic/mysql
    - command: ./prov_mysql_2.sh
    - environment:
      - MYSQL_USER: {{ pillar['mysql']['user'] }}
      - MYSQL_PASS: {{ pillar['mysql']['pass'] }}
      - MYSQL_DATABASE: {{ pillar['mysql']['database'] }}

    - port_bindings:
      - 3306:{{ pillar['mysql']['port'] }}
    - replace: True
    - detach: True
  require:
    - docker_image.present: karic/mysql


