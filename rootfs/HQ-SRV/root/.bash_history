cd /etc/net/
vim /etc/gai.conf 
hostnamectl set-hostname hq-srv
cd ifaces/
vim default/options
vim enp0s3/options 
vim enp0s3/options 
echo 192.168.1.2/24 > enp0s3/ipv4address
echo 2000:1::1:2/112 > enp0s3/ipv6address
echo default via 192.168.1.1 > enp0s3/ipv4route
echo default via 2000:1::1:1 > enp0s3/ipv6route
echo nameserver 8.8.8.8 8.8.4.4 > enp0s3/resolv.conf
vim /root/.bashrc 
history -w
history 
vim /etc/net/ifaces/enp0s3/options
reboot
history 
ip a
apt-get install bind-utils nftables
shutdown now
apt-get install git make
git clone https://github.com/Ivashkka/demo_exam
cd demo_exam/
git checkout altlinux 
ping 192.168.2.2
ip a
vim /etc/net/ifaces/
vim /etc/net/ifaces/enp0s3/options
cd /etc/net/ifaces/enp0s3/
ls
mkdir old
mv ipv* old/
ls
mv resolv.conf old/
ls
cd ..
systemctl restart network
ip a
ip a
ip a
ls
cd enp0s3/
ls
vim options
systemctl restart network
ip a
ip a
ip a
vim /etc/net/ifaces/default/options
vim /etc/net/ifaces/enp0s3/
ls
cat options~
cat options
vim options~
ls 
cat *
ls
rm options~~
rm -f options~~
ls
systemctl restart network
ip a
vim options
systemctl restart network
ip a
vim options
systemctl restart network
vim options
ls /etc/NetworkManager/
vim options
systemctl restart network
ip a
ip a
vim options
ip a
ip a
systemctl restart network
ip a
reboot
ip a
vim /etc/net/ifaces/enp0s3/options
systemctl restart network
vim /etc/net/ifaces/enp0s3/options
ip a
vim /etc/net/ifaces/enp0s3/options
systemctl restart network
ip a
apt-get install NetworkManager
ip r
ping 1.1.1.1
apt-get install NetworkManager
host ya.ru
apt-get install NetworkManager
cd /etc/net/ifaces/enp0s3/
ls
cp old/resolv.conf .
ls
systemctl restart network
apt-get install NetworkManager
vim options
cp old/* .
systemctl restart network
apt-get install NetworkManager
reboot
ping ya.ru
vim /etc/gai.conf
host ya.ru
ping 1.1.1.1
host ya.ru
ping google.com
vim /etc/net/ifaces/enp0s3/o
vim /etc/net/ifaces/enp0s3/options
systemctl restart network
ping google.com
apt-get install NetworkManager
apt-get update 
apt-get install NetworkManager
apt-get install nmtui
apt-get install NetworkManager-yui
apt-get install NetworkManager-tui
cd /etc/net/ifaces/enp0s3/
ls
rm ipv*
rm -f ipv*
rm -f resolv.conf 
vim options
vim options
vim options
reboot
ip a
ip a
ip a
ipa 
ip a
ip a
ipa
ipa
ip a
ip a
ip a
history 
history | less
ip a
ip r
ip -6 r
nmtui
nmcli connection 
ls /etc/NetworkManager/system-connections/enp0s3.nmconnection 
vim /etc/NetworkManager/system-connections/enp0s3.nmconnection 
host ya.ru
ping ya.ru
vim /etc/gai.conf
vim /etc/gai.conf
systemctl restart network
ping ya.ru
host ya.ru
host google.com
ping google.com
vim /etc/gai.conf
systemctl restart network
ping google.com
vim /etc/gai.conf
systemctl restart network
ping google.com
ping google.com
vim /etc/gai.conf
systemctl restart network
ping google.com
reboot
host ya.ru
ping ya.ru
vim /etc/gai.conf
systemctl restart network
ping ya.ru
ping ya.ru
systemctl restart NetworkManager
ip a
ping ya.ru
vim /etc/gai.conf
systemctl restart network
systemctl restart NetworkManager
ping ya.ru
ping google.com
sysctl net.ipv6.conf.all.prefer_ipv6
ls /proc/sys/net/ipv6/conf/all/
sysctl net.ipv6.conf.all.accept_ra
vim /etc/net/sysctl.conf 
sysctl net.ipv6.conf.all.
sysctl net.ipv6.conf.all.
sysctl net.ipv6.conf.all.
sysctl net.ipv6.conf.all.
sysctl net.ipv6.conf.all. | less
sysctl net.ipv6.conf.all.
ls /proc/sys/net/ipv6/conf/all/
vim /etc/gai.conf
vim /etc/gai.conf
reboot
ip a
ping ya.ru
ping goo
ping google.com
vim /etc/gai.conf
apt-get update
rm -f /etc/nftables/nftables.nft 
cd /root/demo_exam/
git checkout debian 
cp source_cfg/HQ-SRV/etc/nftables.conf /etc/nftables/
mv /etc/nftables/nftables.conf /etc/nftables/nftables.nft
vim /etc/nftables/nftables.nft 
vim /etc/nftables/nftables.nft 
vim /etc/nftables/nftables.nft 
vim /etc/openssh/sshd_config 
systemctl restart sshd.service 
git checkout altlinux 
cat /etc/resolv.conf
shutdown now
