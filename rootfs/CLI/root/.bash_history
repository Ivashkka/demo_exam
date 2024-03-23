vim /etc/gai.conf 
hostnamectl set-hostname cli
cd /etc/net/ifaces/
vim default/options
vim enp0s3/options 
echo 11.11.11.2/24 > enp0s3/ipv4address
echo 2000:1111::2/124 > enp0s3/ipv6address
echo default via 11.11.11.1 > enp0s3/ipv4route
echo default via 2000:1111::1 > enp0s3/ipv6route
echo nameserver 8.8.8.8 8.8.4.4 > enp0s3/resolv.conf
vim /root/.bashrc 
exit
history 
vim /root/.bashrc 
reboot
history 
vim /etc/net/ifaces/enp0s3/options
reboot
history 
apt-get install bind-utils nftables
shutdown now
apt-get install make git
git clone https://github.com/Ivashkka/demo_exam
cd demo_exam/
git checkout altlinux 
cat /etc/net/ifaces/enp0s3/options
git checkout altlinux 
date
shutdown now
