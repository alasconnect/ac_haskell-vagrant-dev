apt-get update -y

# Long process to do dist upgrades noninteractively...
#export DEBIAN_FRONTEND=noninteractive
#unset UCF_FORCE_CONFFOLD
#export UCF_FORCE_CONFFNEW=YES
#ucf --purge /boot/grub/menu.lst
#apt-get -y -o Dpkg::Options::="--force-confnew" --allow-downgrades --allow-remove-essential --allow-change-held-packages -fuy dist-upgrade

apt-get install -y linux-headers-`uname -r`
apt-get install -y build-essential curl wget zip unzip g++ gcc git
apt-get --purge autoremove -y

# Stack needs to run as the user who will be using it...
su vagrant << EOF
cd ~
export PATH=/home/vagrant/.local/bin:$PATH
echo -e "\nPATH=/home/vagrant/.local/bin:$PATH" >> .bashrc
echo "Installing stack..."
wget -nv -q -O - https://get.haskellstack.org/ | sh > /dev/null 2>&1
stack setup
EOF

mkdir -p /home/vagrant/haskell
if mountpoint -q /home/vagrant/haskell; then
    umount -f /home/vagrant/haskell
fi
rm -rf /home/vagrant/haskell/*

mount --bind /vagrant/haskell /home/vagrant/haskell
chown -R vagrant:vagrant /home/vagrant