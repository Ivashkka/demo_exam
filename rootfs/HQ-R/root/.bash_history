history 
history 
vim /root/.bash_logout
history 
history 
history -n
history
history -n
history --help
history -r
history 
cat /root/.bash_history 
history -w
cat /root/.bash_history 
vim /root/.bash_logout
history 
history -w
cat /root/.bash_history 
reboot
history 
qwer
qwe
rqw
erq
wer
history 
reboot
history 
vim /root/.bash_logout
history 
123
exit
history 
vim /root/.bash_logout
history 
123
exit
history 
vim /root/.bash_logout
ip -6 r
echo default via 2000:1::1 /etc/net/ifaces/enp0s3/ipv6route
echo default via 2000:1::1 > /etc/net/ifaces/enp0s3/ipv6route
systemctl restart network
ip -6 r
ip a
vim /etc/nftables/nftables.nft
nft -f /etc/nftables/nftables.nft
cat /etc/net/ifaces/enp0s8/ipv*
cat /etc/net/ifaces/enp0s3/ipv*
shutdown now
apt-get install git make
git clone https://github.com/Ivashkka/demo_exam
cd demo_exam/
git checkout altlinux 
cd /etc/net/ifaces/
mkdir tun1
cp enp0s3/options tun1/
vim tun1/options 
vim tun1/options 
vim tun1/options 
echo 10.0.5.1/30 > tun1/ipv4address
echo 2001::1/124 > tun1/ipv6address
systemctl restart network
ip a
ping 10.0.5.2
modprobe gre
vim /etc/modules
apt-get install strongswan
vim /etc/strongswan/ipsec.secrets 
vim /etc/strongswan/ipsec.conf 
cd /root/demo_exam/
git checkout debian 
rm /etc/strongswan/ipsec.conf 
rm -f /etc/strongswan/ipsec.conf 
cp source_cfg/HQ-R/etc/ipsec.conf  /etc/strongswan/
cd /etc/strongswan/
vim ipsec.conf 
ls -la
systemctl restart ipsec.service 
systemctl status ipsec.service 
ping 10.0.5.2
apt-get install frr
vim /etc/frr/daemons 
cd /root/demo_exam/
cp source_cfg/HQ-R/etc/frr/frr.conf 
rm -f /etc/frr/frr.conf 
cp source_cfg/HQ-R/etc/frr/frr.conf /etc/frr/
cd /etc/frr/
vim frr.conf 
systemctl restart frr.service 
systemctl status frr.service 
vtysh 
apt-get install dhcp-server
apt-get install radvd
ls /etc/radvd.conf 
rm -f /etc/radvd.conf 
cd /root/demo_exam/
cp source_cfg/HQ-R/etc/radvd.conf /etc/
vim /etc/radvd.conf 
ls /etc/dhcp/
cat /etc/dhcp/dhcpd.conf
cat /etc/dhcp/dhcpd.conf.sample 
cp source_cfg/HQ-R/etc/dhcp/* /etc/dhcp/
ls /etc/dhcp/
cd /etc/dhcp
vim dhcpd.conf
vim dhcpd.conf
vim dhcpd6.conf
vim dhcpd6.conf
systemctl enable frr
systemctl enable radvd.service 
systemctl start radvd.service 
systemctl status radvd.service 
systemctl edit --full dhcpd
systemctl edit --full dhcpd6
systemctl enable dhcpd
systemctl enable dhcpd6
systemctl start dhcpd
systemctl status dhcpd
vim /etc/dhcp/dhcpd.conf
systemctl start dhcpd6
systemctl status dhcpd6
vim /etc/dhcp/dhcpd.conf
vim /etc/sysconfig/dhcpd
vim /etc/sysconfig/dhcpd6 
systemctl restart dhcpd
systemctl restart dhcpd6
systemctl status dhcpd6
systemctl status dhcpd6
systemctl status dhcpd4
systemctl status dhcpd
systemctl status radvd.service 
ping ya.ru
ip a
apt-get update
apt-get install iperf3
iperf3 -c 22.22.22.1
cd /root/demo_exam/
ls source_cfg/HQ-R/root/etc_bckp.sh 
cp source_cfg/HQ-R/root/etc_bckp.sh /root/
cp source_cfg/HQ-R/etc/systemd/system/etc_bckp.* /etc/systemd/system
systemctl daemon-reload 
systemctl status etc_bckp.
systemctl status etc_bckp.service 
cat /root/etc_bckp.sh 
mkdir /opt/backup
systemctl start etc_bckp.service 
systemctl start etc_bckp.timer 
reboot
systemctl status dhcpd
systemctl status dhcpd6
systemctl enable etc_bckp.timer 
systemctl status etc_bckp.service 
systemctl status etc_bckp.timer 
reboot
systemctl status etc_bckp.timer 
ls /opt/backup/
systemctl status etc_bckp.service 
chmod +x /etc/bash
chmod +x /root/etc_bckp.sh 
cd /root/demo_exam/
rm -f /etc/nftables/nftables.nft
cp source_cfg/HQ-R/etc/nftables.conf /etc/nftables/
mv /etc/nftables/nftables.conf /etc/nftables/nftables.nft
vim /etc/nftables/nftables.nft
nft -f /etc/nftables/nftables.nft
git checkout altlinux 
ls -la /etc/dhcp
ls -la /etc/radvd.conf 
shutdown now
