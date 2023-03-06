<h1 align="center">My NixOS Config</h1>

### 创建分区
```shell
parted /dev/sda -- mklabel gpt
parted /dev/sda -- mkpart ESP fat32 1MB 512MB
parted /dev/sda -- set 1 esp on
parted /dev/sda -- mkpart primary 512MB -8GB
parted /dev/sda -- mkpart primary linux-swap -8GB 100%
```
### 格式化分区
```shell
mkfs.fat -F 32 -n boot /dev/sda1
mkfs.ext4 -L nixos /dev/sda2
mkswap -L swap /dev/sda3
```
### 创建挂载点
```shell
mount -t tmpfs none /mnt
mkdir -p /mnt/{boot,nix,etc/nixos,var/log}
mount /dev/sda1 /mnt/boot
mount /dev/sda2 /mnt/nix
mkdir -p /mnt/nix/persist/{etc/nixos,var/log}
mount -o bind /mnt/nix/persist/etc/nixos /mnt/etc/nixos
mount -o bind /mnt/nix/persist/var/log /mnt/var/log
```
### 生成默认配置
```shell
nixos-generate-config --root /mnt # 这步报错 ERROR: Not a Btrfs filesystem: Invalid argument
```
### 克隆配置
```shell
nix-shell -p git
git clone  https://github.com/wasdjkl/nixos.git /mnt/etc/nixos --depth 1
cd  /mnt/etc/nixos/
```
### 修改硬件配置 
```shell
nano hardware-configuration.nix
```

添加 options
```
fileSystems."/" = {
  device = "none";
  fsType = "tmpfs";
  options = [ "defaults" "size=2G" "mode=755" ];
};
```
### 安装
```shell
nixos-install --flake .#laptop
```
### 重启
```shell
reboot
```
