apt-get update -y

# Long process to do dist upgrades noninteractively...
export DEBIAN_FRONTEND=noninteractive
unset UCF_FORCE_CONFFOLD
export UCF_FORCE_CONFFNEW=YES
ucf --purge /boot/grub/menu.lst
apt-get -y -o Dpkg::Options::="--force-confnew" --allow-downgrades --allow-remove-essential --allow-change-held-packages -fuy dist-upgrade

apt-get install -y linux-headers-`uname -r`
apt-get install -y build-essential curl wget zip unzip g++ gcc git

wget -qO- https://get.haskellstack.org/ | sh
apt-get --purge autoremove -y