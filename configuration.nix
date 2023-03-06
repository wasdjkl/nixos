# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nas"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Set your time zone.
  time.timeZone = "Asia/Shanghai";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkbOptions in tty.
  # };

  # Enable the X11 windowing system.
  # services.xserver.enable = true;


  # Configure keymap in X11
  # services.xserver.layout = "us";
  # services.xserver.xkbOptions = {
  #   "eurosign:e";
  #   "caps:escape" # map caps to escape.
  # };

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # sound.enable = true;
  # hardware.pulseaudio.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # 指定是否允许用户和组的可变性
  # 如果mutableUsers设置为true，则会允许使用普通的useradd和groupadd命令添加和修改用户和组。
  # 如果mutableUsers设置为false，则只能通过配置文件来管理用户和组，而不能使用useradd和groupadd命令。这可以提供更高的安全性，并防止误操作导致系统不稳定。
  users.mutableUsers = false;
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.wasdjkl = {
    isNormalUser = true;
    extraGroups = [ "wheel" "docker" "networkmanager" ]; # Enable ‘sudo’ for the user.
    openssh.authorizedKeys.keys = [ "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCuoZ5n2KrP3CWMaVHNNHkGTE+QzOEvYTB5vxbYHNi6kgteYMcwphk5eMuGy5LRASzR0wBlBP4m0mKRtHhYIrAWTpP1eKfUgF7X7qdQIwWEdCiIoiTcYAdkoBG/C/a2nw8t0mVo3rO4MKAvMs0FY7mL0qI8IILXRtJwHYJp/E+aLdCnQmTgSN3Dj8w48/ta091DbNPza9phyBUp0xk7gOe+R6Mw2RYuiPNzWBdW+9lah6w0yRLiPvAEbAznWnXi4Uzv2clw7WVCv6mjxmKmkRZFhhdzD0HpcvR1i1X2oTHwNa5iXC1NXg0/Ht7C+DM7uYxiqEi/+AgPuWAsN+N1SKNhJNirAfhZZB32ROV3BLh6bmwbhqB2o7usKP09CIo4XnDudE5kyxl9fqoJkE1ph8pl8VNnhUaJwqvXKnkBuOU94TTwhttdXvpS/clRk5AMfu1unH24K/6lbcwOJYj8JmBiet5+PSYqMVio+fQmemrDP1tY2VTdnJrAhf8OLmPL61BaK6Vn3FoL0EboWlWLiiaGN1tyItlxoKdOX2wzjSvfSC+5Cs6R+BXgblcsilrRfCG+FdGjPxf4UtlFJWJcdwSbD0n7TeubgG9I0ohPJ7SUCNb6VbUMD+DE2FMndKLJQgSKT2dDGQP2KfIW2OazkwvTvFYEvIZnjpUXC7+oF0a+9w==" ];
    hashedPassword = "$y$j9T$hu3W44l8/2K2jjfke8XU41$1Ej6rh.fGqy1ngk9GISlXHvf7mUttz6WHQ/P7NNfVXB";
    # packages = with pkgs; [

    # ];
  };

  users.users.root = {
    openssh.authorizedKeys.keys = [ "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCuoZ5n2KrP3CWMaVHNNHkGTE+QzOEvYTB5vxbYHNi6kgteYMcwphk5eMuGy5LRASzR0wBlBP4m0mKRtHhYIrAWTpP1eKfUgF7X7qdQIwWEdCiIoiTcYAdkoBG/C/a2nw8t0mVo3rO4MKAvMs0FY7mL0qI8IILXRtJwHYJp/E+aLdCnQmTgSN3Dj8w48/ta091DbNPza9phyBUp0xk7gOe+R6Mw2RYuiPNzWBdW+9lah6w0yRLiPvAEbAznWnXi4Uzv2clw7WVCv6mjxmKmkRZFhhdzD0HpcvR1i1X2oTHwNa5iXC1NXg0/Ht7C+DM7uYxiqEi/+AgPuWAsN+N1SKNhJNirAfhZZB32ROV3BLh6bmwbhqB2o7usKP09CIo4XnDudE5kyxl9fqoJkE1ph8pl8VNnhUaJwqvXKnkBuOU94TTwhttdXvpS/clRk5AMfu1unH24K/6lbcwOJYj8JmBiet5+PSYqMVio+fQmemrDP1tY2VTdnJrAhf8OLmPL61BaK6Vn3FoL0EboWlWLiiaGN1tyItlxoKdOX2wzjSvfSC+5Cs6R+BXgblcsilrRfCG+FdGjPxf4UtlFJWJcdwSbD0n7TeubgG9I0ohPJ7SUCNb6VbUMD+DE2FMndKLJQgSKT2dDGQP2KfIW2OazkwvTvFYEvIZnjpUXC7+oF0a+9w==" ];
    hashedPassword = "$y$j9T$hu3W44l8/2K2jjfke8XU41$1Ej6rh.fGqy1ngk9GISlXHvf7mUttz6WHQ/P7NNfVXB";
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    docker-compose
    htop
    atool
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.11"; # Did you read the comment?

# Also need to run this
#: smbpasswd -a chuang
services.samba = {
  enable = true;
  shares.media = {
    path = "/home/wasdjkl/media";
    "guest ok" = false;
    "read only" = false;
  };
};

# 指定在关闭笔记本电脑盖子时要执行的操作。
services.logind.lidSwitch = "ignore";

virtualisation.docker.enable = true;

  nix.settings = {
    # 二进制缓存URL列表，用于获取Nix软件包的预构建二进制文件。默认情况下，添加了 https://cache.nixos.org/。
    substituters = [
      # USTC - 中国科学技术大学开源软件镜像
      "https://mirrors.ustc.edu.cn/nix-channels/store"
      # TUNA - 清华大学开源软件镜像站
      # "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
      # BFSU - 北京外国语大学开源软件镜像站
      # https://mirrors.bfsu.edu.cn/nix-channels/store
      # NJU - 南京大学开源镜像站
      # https://mirror.nju.edu.cn/nix-channels/store
      # SJTUG - Siyuan - SJTUG 思源镜像站
      # https://mirror.sjtu.edu.cn/nix-channels/store
      # ISRC-ISCAS - ISCAS 镜像站
      # https://mirror.iscas.ac.cn/nix-channels/store
      # 官方
      "https://cache.nixos.org/"
    ];
    # 如果设置为true，Nix会自动检测存储中内容相同的文件，并用指向单个副本的硬链接替换它们。这样可以节省磁盘空间。如果设置为false（默认值），您仍然可以运行nix-store --optimise来清除重复的文件。
    auto-optimise-store = false;
  };

  programs.zsh.ohMyZsh = {
    enable = true;
    plugins = [ "git" "python" "man" ];
    theme = "agnoster";
  };

}

