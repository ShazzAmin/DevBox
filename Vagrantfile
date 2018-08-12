require_relative "config"

Vagrant.configure("2") do |vagrant|
  # Provider
  vagrant.vm.provider "virtualbox" do |vm|
    vm.gui = false
    vm.name = Config::NAME
    vm.cpus = Config::CPUS
    vm.memory = Config::MEMORY
  end

  # Box
  vagrant.vm.box = "archlinux/archlinux"
  vagrant.vm.box_check_update = true

  # Network
  vagrant.vm.network "private_network", ip: Config::IP

  # Synced Folder
  vagrant.vm.synced_folder ".", "/home/vagrant/files", type: "virtualbox", mount_options: ["dmode=775", "fmode=774"]
 
  # Provision
  vagrant.vm.provision "shell", inline: <<-SHELL
    hostname #{Config::NAME}
    pacman -Syu --noconfirm
    pacman -S --noconfirm bash git tmux vim
    HOME=/home/vagrant /home/vagrant/files/dotfiles/setup.sh
  SHELL
end
