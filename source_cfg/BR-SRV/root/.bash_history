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
ping ya.ru
ping ya.ru
ping 2000:2::2:1
ip a
ping 2000:2::2:1
vim /etc/network/interfaces
systemctl restart networking
vim /etc/network/interfaces
ping 2000:2::1:1
ping 2000:1::1:1
ping 2000:2::1:2
reboot 
vim /etc/network/interfaces
systemctl restart networking.service 
hostnamectl set-hostname BR-SRV
bash
apt install openssh-server
history 
exit
ls
apt install git
history 
git clone https://github.com/Ivashkka/demo_exam
vim demo-git-token
cd demo_exam/
ls
cd source_cfg/
ls
mkdir BR-SRV
cd BR-SRV/
ls
mkdir roo
rm -r roo/
mkdir root
mkdir etc
cd etc/
mkdir ssh
mkdir network
cp /etc/gai.conf .
cp /etc/network/interfaces network/
cp /etc/ssh/sshd_config ssh/
ls
cp /etc/passwd .
cp /etc/group .
ls
ls
ls
cd ..
ls -la root/
cp /root/.bashrc root/
ls -la root/
cd ..
ls
cd ../..
git stat
cd demo_exam/
cd source_cfg/BR-
cd source_cfg/BR-SRV/
ls
cd ..
git stat
git status
git add --all
git config --global user.name Ivashkka
git config --global user.email ivashka.2.r@gmail.com
git commit -am "BR-SRV configs"
git config --global credential.helper 'cache --timeout=3600'
ls
git push origin
exit
apt install tcpdump
tcpdump -i enp0s3 
tcpdump6 -i enp0s3 
tcpdump -i enp0s3 ipv6
tcpdump -i enp0s3 -6
tcpdump -i enp0s3 ip6
useradd -m branch-admin
useradd -m network-admin
passwd branch-admin 
passwd network-admin 
usermod -aG sudo branch-admin 
usermod -aG sudo network-admin 
shutdown now
ls
cd demo_exam/
git pull origin 
cd source_cfg/BR-SRV/
cd etc/
cp /etc/passwd passwd 
cp /etc/group group 
ls
пше ыефе
git status 
cp /etc/network/interfaces network/interfaces 
git status 
git commit -am "new users"
git push origin 
git log --all --graph  --oneline 
ls
exit
history 
vim /etc/ssh/sshd_config
systemctl restart sshd
exit
shutdown now
vim /etc/resolv.conf 
vim /etc/NetworkManager/NetworkManager.conf 
ls -la /etc/resolv.conf 

vim /etc/NetworkManager/NetworkManager.conf 
systemctl restart NetworkManager
vim /etc/resolv.conf 
systemctl restart networking.service 
vim /etc/resolv.conf 
host hq-srv
reboot 
cat /etc/resolv.conf 
systemctl edit --full NetworkManager-wait-online.service 
systemctl edit --full NetworkManager.service 
systemctl edit --full NetworkManager-dispatcher.service 
systemctl edit --full systemd-networkd-wait-online.service 
reboot 
history 
history 
cd demo_exam/
git pull origin 
cat /root/demo-git-token 
history 
history | egrep 'vim|systemctl edit|git'
history | egrep 'vim|systemctl edit|git' | tail -20
history | egrep 'vim|systemctl edit|git' | tail -20
cd source_cfg/BR-SRV/
cp /etc/ssh/sshd_config etc/ssh/sshd_config 
cd etc/
cp /etc/resolv.conf .
mkdir NetworkManager
ls
cp /etc/NetworkManager/NetworkManager.conf NetworkManager/
ls
mkdir systemd
mkdir systemd/system
cp /etc/systemd/system/systemd-networkd-wait-online.service systemd/system/
ls
history 
cd ../../..
git status 
git add --all
git status 
git commit -am "static dns & network boot wait timeout"
git push origin 
exit
su -
ls
timedatectl set-timezone Europe/Moscow 
vim /etc/systemd/timesyncd.conf 
systemctl restart networkd-times
systemctl restart systemd-times
systemctl restart systemd-timesyncd.service 
timedatectl timesync-status 
date
hwclock 
cat demo-git-token 
cd demo_exam/
git pull origin 
cd source_cfg/BR-SRV/
cd etc/
cp /etc/timezone .
cp /etc/systemd/timesyncd.conf systemd/
ls systemd/
cd ../../..
git status 
git add --all
git status 
git commit -am "ntp sync"
git push origin 
cd ..
shutdown now
