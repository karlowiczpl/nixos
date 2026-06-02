{ pkgs, ... }:

{
  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu_kvm;
      swtpm.enable = true;
    };
  };

  programs.virt-manager.enable = true;

  services.samba = {
    enable = true;
    openFirewall = true;

    settings = {
      global = {
        workgroup = "WORKGROUP";
        security = "user";
        "map to guest" = "Bad User";
        "server min protocol" = "NT1";
      };

      share = {
        path = "/home/karol/Electronics/";
        browseable = "yes";
        writable = "yes";
        "guest ok" = "yes";
        "read only" = "no";
      };
    };
  };
}
