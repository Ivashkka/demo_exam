usermod -aG wheele ivanadm
usermod -aG wheel ivanadm
cat /etc/passwd
cat /etc/gro
cat /etc/group
cat /etc/group | grep wh
cat /etc/group | grep w
cat /etc/group | grep su
usermod -aG sudo ivanadm
visudo 
cat /etc/passwd | grep ivan
usermod -aG sudo ivanadm
cat /etc/passwd | grep ivan
cat /etc/passwd | grep root
groups ivanadm 
reboot 
nmcli help 
systemctl status network
nmcli connection 
systemctl list-units
systemctl status NetworkManager
systemctl status NetworkManager-dispatcher.service 
cat /etc/network/interfaces
cat /etc/network/if-up.d/resolved 
cat /etc/network/if-up.d/avahi-autoipd 
cat /etc/NetworkManager/NetworkManager.conf 
vim /etc/network/interfaces
nano /etc/network/interfaces
ipa
ip a
nano /etc/network/interfaces
systemctl restart networking.service 
ping ya.ru
ip a
shutdown now
systemctl edit --full networking
shutdown now
vim /etc/network/interfaces
nano /etc/network/interfaces
nano /etc/network/interfaces
nano /etc/network/interfaces
ping6 2000:1::1
ping6 2000:2::2
ping ya.ru
ip r
ip a
ping 1.1.1.1
ip a
ping ya.ru
vim /etc/gai.conf 
nano /etc/gai.conf 
ping ya.ru
nano /etc/gai.conf 
man gai.conf 
nano /etc/gai.conf 
apt update 
apt upgrade 
apt install vim net-tools tcpdump
vim .bashrc 
bas
bash
ls
apt install git
ls
ls
git clone https://github.com/Ivashkka/demo_exam.git
cd demo_exam/
git config --global user.name Ivashkka
git config --global user.email ivashka.2.r@gmail.com
git config --global credential.helper 'cache --timeout=3600'
vim /root/demo-git-token
exit
vim /root/demo-git-token
ls
cd demo_exam/
ls
cd source_cfg/
ls
mkdir HQ-SRV
cd HQ-SRV/
ls
mkdir root
mkdir etc
ls
cp /root/.bashrc root/
ls -la root/
cd etc/
ls
mkdir network
cp /etc/network/interfaces network/
cp /etc/gai.conf .
ls
mkdir ssh
cp /etc/ssh/sshd_config ssh/
cp /etc/passwd .
cp /etc/group .
ls
history | grep vim
ls
history 
ls
cd ../../..
ls
git status 
git add --all
git status 
git commit -am "HQ-SRV configs"
git push origin 
ls
exit
apt install openssh-server
ip a
vim /etc/network/interfaces
systemctl restart networking.service 
cd demo_exam/source_cfg/HQ-SRV/
git pull origin 
ls
history 
ls
cp /etc/network/interfaces etc/network/interfaces 
cat etc/network/interfaces 
cp /etc/passwd etc/passwd 
cp /etc/group etc/group 
git status 
git commit -am "network over dhcp & new users"
cat /root/demo-git-token 
git push origin 
git push origin 
учше
exit
vim /etc/network/interfaces
systemctl restart networking.service 
systemctl status networking.service 
ip a
vim /etc/network/interfaces
systemctl restart networking.service 
systemctl status networking.service 
ip a
ip -6 r
ping 2000:2::1:2
ping 2000:1::1
systemctl restart networking.service 
ip a
ip -6 r
systemctl restart networking.service 
ip -6 r
systemctl restart networking.service 
ip -6 r
ping 2000:2::1:2
ping 2000:2::1:2
vim /etc/network/interfaces
useradd -m admin
passwd admin 
usermod -aG admin 
usermod -aG sudo admin 
history 
reboot 
vim /etc/ssh/sshd_config
vim /etc/ssh/sshd_config
systemctl restart sshd
exit
exit
vim /etc/nftables.conf 
nft -f /etc/nftables.conf 
nft list ruleset
nft list ruleset
nft list ruleset
nft list ruleset
nft list ruleset
nft list ruleset
nft list ruleset
history | grep apt install
history | grep "apt install"
exit
systemctl restart networking.service 
ip a
host hq-srv
host br-srv
exit
systemctl restart networking.service 
cat /etc/resolv.conf 
ifconfig -a
ifconfig --all
ifconfig
ip systemd-resolve --status
nslookup domain
nslookup --help
gig AAAA hq-srv
dig AAAA hq-srv
exit
history 
systemctl edit --full systemd-networkd-wait-online.service 
reboot 
systemctl restart networking.service 
ip a
ip a
host hq-r
host hq-srv
host br-r
history | egrep 'vim|systemctl edit|git' | tail -40
history | egrep 'vim|systemctl edit|git'
history | egrep 'vim|systemctl edit|git' |tail
history | egrep 'vim|systemctl edit|git' | tail -15
ls
cd demo_exam/
cat ../demo-git-token 
ls
cd source_cfg/
cd HQ-SRV/
cd etc/
cd ..
git pull origin 
cd etc/
ls
history | egrep 'vim|systemctl edit|git' | tail -15
ls
cp /etc/nftables.conf .
cp /etc/network/interfaces network/interfaces 
cp /etc/ssh/sshd_config ssh/sshd_config 
ls
mkdir systemd
mkdir systemd/system
cp /etc/systemd/system/systemd-networkd-wait-online.service 
cp /etc/systemd/system/systemd-networkd-wait-online.service systemd/system/
ls
cd ../../..
git status 
git add --all
git status 
git commit -am "ssh filter & network boot wait timeout"
git push origin 
exit
systemctl edit --full systemd-timesyncd.service 
vim /etc/systemd/timesyncd.conf 
vim /etc/systemd/timesyncd.conf 
systemctl restart systemd-timesyncd.service 
timedatectl show-timesync --all
timedatectl status
timedatectl set-timezone Europe/Moscow 
systemctl restart systemd-timesyncd.service 
timedatectl status
hwclock 
hwclock -s
hwclock 
date
date
cat demo-git-token 
cd demo_exam/
git pull origin 
host ya.ru
ls
cd source_cfg/
cd HQ-SRV/
ls
cd etc/systemd/
ls
ls /etc/systemd/
cp /etc/systemd/timesyncd.conf .
ls
cd ..
cp /etc/timezone .
ls
cd ..
cd ..
cd ..
git status 
git add --all
git status 
git commit -am "ntp sync"
git push origin 
exit
