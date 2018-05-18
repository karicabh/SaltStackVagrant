run_karic/petclinic_run:
  docker_container.run:
    - image: karic/petclinic_run
    - replace: True
    - detach: True
  require:
    - docker_image.present: karic/petclinic_run
