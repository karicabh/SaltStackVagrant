karic/mysql:
  docker_image.present:
    - tag: latest
    - force: True
run_karic/mysql:
  docker_container.running:
    - name: mysql
    - image: karic/mysql
    - port_bindings:
      - 3306:3306
    - replace: True
    - detach: True
  require:
    - docker_image.present: karic/mysql

#create_petlinic_db:
#  cmd.run:
#    - name: mysql -u root -e "CREATE DATABASE petclinic";
