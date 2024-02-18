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
hostnamectl set-hostname CLI
shutdown now
vim /etc/network/interfaces
systemctl restart networking.service 
ping ya.ru
ip a
ping 172.16.111.1
vim /etc/network/interfaces
systemctl restart networking.service 
shutdown now
ping ya.ru
ping 2000:1::1:2
ping 2000:1::1:1
shutdown now
ls
vim /root/.bashrc 
q
vim demo-git-token
git clone https://github.com/Ivashkka/demo_exam.git
ls
cd demo_exam/
ls
git config --global user.name Ivashkka
git config --global user.email ivashka.2.r@gmail.com
git config --global credential.helper 'cache --timeout=3600'
ls
cd source_cfg/
ls
mkdir CLI
ls
cd CLI/
mkdir root
mkdir etc
cp /root/.bashrc root/
ls -la root/
cd etc/
mkdir ssh
mkdir network
cp /etc/passwd .
cp /etc/group .
cp /etc/gai.conf .
vim /etc/gai.conf 
ls
cp /etc/network/interfaces network/
ls
cp /etc/ssh/sshd_config ssh/
ls
ls ssh/
ls network/
cat network/interfaces 
cd ../../..
ls
git status 
git add --all
git status 
git commit -am "CLI configs"
git push origin 
ls
git status 
exit
apt install openssh-server git
useradd -m admin
passwd admin 
usermod -aG sudo admin 
cd /root/demo_exam/
ls
git pull origin 
cat /root/demo-git-token 
vim /root/demo-git-token 
cat /root/demo-git-token 
ls
cd source_cfg/CLI/
ls
cd etc/
ls
cp /etc/passwd passwd 
cp /etc/group group 
cd ../..
git status 
git commit -am "CLI new users"
git push origin 
git status 
cd ../..
shutdown now
shutdown now
vim /etc/systemd/timesyncd.conf 
timedatectl set-timezone Europe/Moscow 
systemctl restart systemd-timesyncd.service 
ls
cd demo_exam/
date
hwclock 
timedatectl timesync-status 
ls
git status 
git pull origin 
cat ../demo-git-token 
cd source_cfg/CLI/
cd etc/
cp /etc/timezone .
ls
mkdir systemd
ls
cp /etc/systemd/timesyncd.conf systemd/
systemctl edit --full systemd-networkd-wait-online.service 
cp /etc/systemd/system/systemd-networkd-wait-online.service systemd/
ls systemd/
cat systemd/systemd-networkd-wait-online.service 
cd ..
cd ../...
cd ../..
ls
git status 
git add --all
git status 
git commit -am "ntp sync"
git push origin 
cd ..
shutdown now
