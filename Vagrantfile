Vagrant.configure("2") do |config|
	config.vm.box     = "ubuntu_12_04_x64_puppetlabs"
	config.vm.box_url = "http://puppet-vagrant-boxes.puppetlabs.com/ubuntu-server-12042-x64-vbox4210.box"
	config.vm.network :private_network, ip: "192.168.33.12"
	config.vm.provision "puppet" do |puppet|
		puppet.manifests_path = "puppet/manifests"
		puppet.module_path    = "puppet/modules"
		puppet.manifest_file  = "default.pp"
		puppet.options        = ['--verbose --debug']
	end

end