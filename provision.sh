apt-get update -y

apt-get install -y linux-headers-`uname -r`
apt-get install -y build-essential curl wget zip unzip g++ gcc git
apt-get install -y zlib1g-dev libmysqlclient-dev libpq-dev

sudo apt-get install -y haskell-platform
wget -qO- https://get.haskellstack.org/ | sh
apt-get --purge autoremove -y

echo "RUN THIS AFTER PROVISION:"
echo "vagrant ssh"
echo "cd /home/vagrant/haskell"