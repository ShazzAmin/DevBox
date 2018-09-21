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
  vagrant.vm.box_version = "2018.08.05"
  vagrant.vm.box_check_update = true

  # Network
  vagrant.vm.network(
    "private_network",
    ip: Config::IP
  )

  # Shared Folders
  folders = [{ name: "DevBox", path: "." }]
  folders.concat(Config::FOLDERS)
  Config::FOLDERS_PARENTS.each do |folders_parent|
    Dir.foreach(folders_parent) do |child_name|
      next if child_name == "." or child_name == ".."

      child_path = File.join(folders_parent, child_name)
      next if not File.directory?(child_path)

      folders.push({ name: child_name, path: child_path })
    end
  end

  folders.each do |folder|
    vagrant.vm.synced_folder(
      folder[:path],
      File.join("/home/vagrant/", folder[:name]),
      type: "nfs"
    )
  end

  # Provision
  vagrant.vm.provision(
    "shell",
    privileged: true,
    inline: <<-SHELL
      hostnamectl set-hostname "#{Config::NAME}"
      hostname "#{Config::NAME}"
      pacman -Syu --noconfirm
      pacman -S --noconfirm bash git tmux vim
      pacman -S --noconfirm nodejs npm
    SHELL
  )

  vagrant.vm.provision(
    "shell",
    privileged: false,
    inline: <<-SHELL
      /home/vagrant/DevBox/dotfiles/setup.sh
    SHELL
  )
end
