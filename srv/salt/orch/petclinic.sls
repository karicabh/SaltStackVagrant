deploy_mysql:
  salt.state:
    - tgt: 'master'
    - sls:
      - deploy.mysql

deploy_petlicinc:
  salt.state:
    - tgt: 'web*'
    - sls:
      - deploy.petclinic_deploy
    - require:
      - salt: deploy_mysql
