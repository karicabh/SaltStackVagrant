```
  vagrant up
  vagrant ssh master
  sudo su
  salt-key --accept-all
  salt * state.apply
  salt 'master' state.apply jdk
  salt 'master' state.apply mvn
  salt 'master' state.apply build
  salt 'web*' state.apply deploy
```
