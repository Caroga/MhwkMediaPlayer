# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    config.ssh.forward_agent = true
    config.vm.box = "ubuntu/trusty64"

    config.vm.provider "virtualbox" do |v|
        v.memory = 1024
    end

    config.vm.define "mhwk" do |mhwk|
        mhwk.vm.network "private_network", ip: "192.168.60.10"
        mhwk.vm.network "forwarded_port", guest: 22, host: 2223, auto_correct: true
    end

    if Vagrant::Util::Platform.windows?
        config.vm.provision "shell", path: "provisioning/local.sh"
        config.vm.synced_folder ".", "/vagrant"
    else
        config.vm.provision "ansible" do |ansible|
            ansible.playbook = "provisioning/playbook.yml"
            ansible.inventory_path = "provisioning/hosts"
            ansible.limit = "development:!local"
        end
    end
end
