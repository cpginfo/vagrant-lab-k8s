$INTERFACE="Intel(R) I211 Gigabit Network Connection" #Nome da interface de rede

hosts = {
  "master" => {"memory" => "2048", "cpu" => "2", "ip" => "192.168.0.50", "image" => "ubuntu/focal64" },
  "node1" => {"memory" => "1024", "cpu" => "1", "ip" => "192.168.0.51", "image" => "ubuntu/focal64" },
  "node2" => {"memory" => "1024", "cpu" => "1", "ip" => "192.168.0.52", "image" => "ubuntu/focal64" }
}
Vagrant.configure("2") do |config|

  hosts.each do |name, conf|
   config.vm.define "#{name}" do |host|
     host.vm.box = "#{conf["image"]}"
     host.vm.hostname = "#{name}"
     host.vm.network "public_network", ip: "#{conf["ip"]}", bridge: $INTERFACE
	     host.vm.provider "virtualbox" do |vb|
         vb.name = "#{name}"
         vb.memory = conf["memory"]
		     vb.cpus   = conf["cpu"]
         vb.customize ["modifyvm", :id, "--groups", "/K8s-Lab"]
		   end
     host.vm.provision "shell", path: "script.sh"
     if "#{name}" == "master"
       host.vm.provision "shell", path: "master.sh"
     else
       host.vm.provision "shell", path: "worker.sh"
      end
    end
  end
end