
Vagrant.configure("2") do |config|

	(1..3).each do |i|
		config.vm.define "worker#{i}" do |worker|
			worker.vm.box = "ubuntu/xenial64"
			worker.vm.network "private_network", ip: "192.168.0.11#{i}", virtualbox__intnet: true
			worker.vm.provider "virtualbox" do |workervm|
				workervm.memory = 4096
				workervm.cpus = 2
			end
			worker.vm.provision "shell", path: "worker.sh"
			worker.vm.hostname = "worker#{i}.ajohnsc.io"
		end
	end

	config.vm.define "master" do |master|
		master.vm.box = "ubuntu/xenial64"
		master.vm.network "private_network", ip: "192.168.0.110", virtualbox__intnet: true
		master.vm.network "forwarded_port", guest: 80, host: 8080
		master.vm.provider "virtualbox" do |mastervm|
			mastervm.memory = 4096
			mastervm.cpus = 2
		end
		master.vm.provision "shell", path: "master.sh"
		master.vm.hostname = "master.ajohnsc.io"
	end

end
