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
