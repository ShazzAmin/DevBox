module Config
  # Name of VM, also the hostname
  # - a string
  NAME = "DevBox"

  # Number of CPU threads to share with VM
  # - a number
  CPUS = 4

  # Maximum amount of memory (in MB) to allow VM to use
  # - a number
  MEMORY = 4096

  # IP address of VM on the private network
  # - a string
  IP = "192.168.11.11"

  # Folders to share with VM
  # - an array of `Hash`es
  #   - `:name` => name of shared folder in VM
  #     - a string
  #   - `:path` => path to shared folder on host
  #     - a string
  FOLDERS = []

  # Parents of folders to share with VM
  # - an array of strings
  #   - path to parent folder on host (all immediate folder children of this are shared with VM)
  FOLDERS_PARENTS = ["../Projects"]
end
