vim /etc/gai.conf 
hostnamectl set-hostname br-srv
cd /etc/net/ifaces/
vim default/options
vim enp0s3/options 
vim enp0s3/options 
vim enp0s3/options 
echo 192.168.2.2/24 > enp0s3/ipv4address
echo 2000:2::1:2/112 > enp0s3/ipv6address
echo default via 192.168.2.1 > enp0s3/ipv4route
echo default via 2000:2::1:1 > enp0s3/ipv6route
echo nameserver 8.8.8.8 8.8.4.4 > enp0s3/resolv.conf
vim /root/.bashrc 
history -w
history 
vim /etc/net/ifaces/enp0s3/options
reboot
history 
apt-get install bind-utils nftables
shutdown now
apt-get install make git
apt-get install make git
ip a
ping 192.168.2.1
ping 33.33.33.2
ping 33.33.33.1
ping 1.1.1.1
ping 1.1.1.1
apt-get install make git
git clone https://github.com/Ivashkka/demo_exam
cd demo_exam/
git checkout altlinux
ls source_cfg/ISP/
reboot
cd demo_exam/
git branch
cat /etc/net/ifaces/enp0s3/options
ip a
ping ya.ru
vim /etc/gai.conf
systemctl restart network
ping ya.ru
vim /etc/gai.conf
apt-get install NetworkManager
apt-get update
apt-get install NetworkManager
apt-get install NetworkManager-tui
reboot
ipa
ip a
ping -4 ya.ru
vim /etc/openssh/sshd_config 
systemctl restart sshd
ip a
systemctl status sshd
ssh my-admin@127.0.0.1 -p 2222
cd /root/demo_exam/
git checkout altlinux 
shutdown now
