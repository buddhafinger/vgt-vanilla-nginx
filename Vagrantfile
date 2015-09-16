# -*- mode: ruby -*-
# vi: set ft=ruby :

#Load YAML module.
require 'yaml'

#Call settings / variables file.
settings = YAML.load_file('settings/vgt.settings.yml')

#Do vagrant stuff with Vagrant v2 - Set box type, call provisioning script, set box name.
 Vagrant.configure("2") do | config | 
    config.vm.box = settings["box"]
    config.vm.provision :shell, :path => settings["bootstrap"]
    config.vm.provision "file", source: "templates/ansible_hosts", destination: "/home/vagrant/ansible_hosts"
    config.vm.host_name = settings["name"]

#Using Virtualbox provider set cores and memory.
    config.vm.provider "virtualbox" do |v|
      v.cpus = settings["vcpu"] 
      v.memory = settings["mem"] 
    end

#Network and port forwarding.
  config.vm.network "forwarded_port", guest: settings["fwdport"]["guest"], host: settings["fwdport"]["host"]

end
