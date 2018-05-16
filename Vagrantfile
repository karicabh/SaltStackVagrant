Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"
  config.vm.provider "virtualbox" do |v|
    v.memory = 4096
    v.cpus = 2
  end
  config.vm.define 'master' do |master|
    master.vm.network "private_network", ip: "192.168.55.2"
    config.vm.synced_folder "srv/", "/srv/", type: "rsync"
    master.vm.hostname = "salt"
    master.vm.provision 'shell', inline: <<-SHELL
    hostnamectl set-hostname master
    yum install -y https://repo.saltstack.com/yum/redhat/salt-repo-latest-2.el7.noarch.rpm
    yum clean expire-cache
    yum install -y salt-master salt-minion
    systemctl restart salt-minion
    systemctl enable salt-minion
    systemctl restart salt-master
    systemctl enable salt-master
    SHELL
  end

  config.vm.define 'minion' do |minion|
    minion.vm.network "private_network", ip: "192.168.55.3"
    minion.vm.network "forwarded_port", guest: 8080, host: 8080
    minion.vm.hostname = "web-minion"
    minion.vm.provision 'shell', inline: <<-SHELL
    yum install -y https://repo.saltstack.com/yum/redhat/salt-repo-latest-2.el7.noarch.rpm
    yum clean expire-cache
    yum install -y salt-minion
    echo "master: 192.168.55.2" >> /etc/salt/minion
    systemctl restart salt-minion
    systemctl enable salt-minion
    SHELL
  end

end
