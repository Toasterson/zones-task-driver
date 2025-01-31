job "q3-lx-server" {
  datacenters = ["dc1"]
  type        = "service"

  group "test" {
    restart {
      attempts = 0
      mode     = "fail"
    }

    task "q3server" {
      driver = "zone"
      config {
        Zonepath  = "/vms"
        Autoboot  = false
        Brand     = "lx"
	Docker = "akshmakov/linuxgsm q3server"
        CpuShares = "8000"
	CappedMemory = "4G"
	LockedMemory = "2G"
	SwapMemory = "4G"
        Lwps      = "3000"

        Attributes = [
          {
            Name  = "resolvers"
            Type  = "string"
            Value = "8.8.8.8"
          },
          {
            Name  = "resolvers"
            Type  = "string"
            Value = "8.8.8.4"
          },
         {
            Name  = "kernel-version"
            Type  = "string"
            Value = "3.16.0"
          },
       ]
        Networks = [
          {
            Physical       = "vnic0"
            AllowedAddress = "192.168.1.122/24"
            Defrouter      = "192.168.1.1"
          },
        ]
      }
    }
  }
}
