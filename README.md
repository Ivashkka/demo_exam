<h1 align="center">DEMO EXAM </h1>
<h3 align="center">this repo contains all source configs for demonstration exam</h3>
<p>based on https://sysahelper.ru/course/view.php?id=10#section-0</p>
<br>
<br>
<h3 align="center">================== DEBIAN VERSION ==================</h3>
<br>
<p><b>AUTO CONFIGURE HOST:</b></p>
<p>clone repo to linux machine:</p>
<p><code>apt install git make; git clone https://github.com/Ivashkka/demo_exam.git; cd demo_exam</code></p>
<p>start autoconfigure script:</p>
<p><code>make install</code></p>
<p>host will be rebooted</p>
<br>
<p><b>all apt package requirements:</b></p>
<pre>net-tools
openssh-server
tcpdump
vim
screen
frr
strongswan
isc-dhcp-server
isc-dhcp-common
radvd
iperf3
bind9
bind9-utils
chrony
</pre>
<p>you can run <code>apt install < apt_requirements.txt</code> to install all at once</p>
<br>
<p><b>network topology</b></p>
<img src="./demo.svg">
<br>
<br>
<p><b>VirtualBox network configuration</b></p>
<img src="./demo_nat_network.png">
<br>
<br>
<p><b>Vms network configuration</b></p>
<img src="./demo_vms.png">
<br>
<br>
<p><b>ISP-HQ-R iperf3 results</b></p>
<img src="./demo-iperf3.png">
<br>
<p><b>source_cfg tree:</b></p>
<pre>
source_cfg/
├── BR-R
│   ├── etc
│   │   ├── frr
│   │   │   ├── daemons
│   │   │   └── frr.conf
│   │   ├── gai.conf
│   │   ├── group
│   │   ├── ipsec.conf
│   │   ├── ipsec.secrets
│   │   ├── modules
│   │   ├── network
│   │   │   └── interfaces
│   │   ├── nftables.conf
│   │   ├── passwd
│   │   ├── resolv.conf
│   │   ├── ssh
│   │   │   └── sshd_config
│   │   ├── sysctl.conf
│   │   ├── systemd
│   │   │   ├── system
│   │   │   │   ├── etc_bckp.service
│   │   │   │   ├── etc_bckp.timer
│   │   │   │   ├── multi-user.target.wants
│   │   │   │   │   ├── frr.service -> /etc/systemd/system/multi-user.target.wants/frr.service
│   │   │   │   │   └── strongswan-starter.service -> /etc/systemd/system/multi-user.target.wants/strongswan-starter.service
│   │   │   │   └── timers.target.wants
│   │   │   │       └── etc_bckp.timer -> /etc/systemd/system/etc_bckp.timer
│   │   │   └── timesyncd.conf
│   │   └── timezone
│   ├── home
│   │   ├── admin
│   │   ├── branch-admin
│   │   ├── ivanadm
│   │   └── network-admin
│   └── root
│       └── etc_bckp.sh
├── BR-R-req.txt
├── BR-SRV
│   ├── etc
│   │   ├── gai.conf
│   │   ├── group
│   │   ├── network
│   │   │   └── interfaces
│   │   ├── NetworkManager
│   │   │   └── NetworkManager.conf
│   │   ├── passwd
│   │   ├── resolv.conf
│   │   ├── ssh
│   │   │   └── sshd_config
│   │   ├── systemd
│   │   │   ├── system
│   │   │   │   └── systemd-networkd-wait-online.service
│   │   │   └── timesyncd.conf
│   │   └── timezone
│   ├── home
│   │   ├── branch-admin
│   │   ├── ivanadm
│   │   └── network-admin
│   └── root
├── BR-SRV-req.txt
├── CLI
│   ├── etc
│   │   ├── gai.conf
│   │   ├── group
│   │   ├── network
│   │   │   └── interfaces
│   │   ├── passwd
│   │   ├── ssh
│   │   │   └── sshd_config
│   │   ├── systemd
│   │   │   ├── systemd-networkd-wait-online.service
│   │   │   └── timesyncd.conf
│   │   └── timezone
│   ├── home
│   │   ├── admin
│   │   └── ivanadm
│   └── root
├── CLI-req.txt
├── HQ-R
│   ├── etc
│   │   ├── bind
│   │   │   ├── named.conf.local
│   │   │   ├── named.conf.options
│   │   │   └── zones
│   │   │       ├── db.1..1.2000
│   │   │       ├── db.1.168.192
│   │   │       ├── db.1..2.2000
│   │   │       ├── db.2.168.192
│   │   │       ├── db.branch
│   │   │       └── db.hq
│   │   ├── chrony
│   │   │   └── chrony.conf
│   │   ├── default
│   │   │   └── isc-dhcp-server
│   │   ├── dhcp
│   │   │   ├── dhcpd6.conf
│   │   │   └── dhcpd.conf
│   │   ├── frr
│   │   │   ├── daemons
│   │   │   └── frr.conf
│   │   ├── gai.conf
│   │   ├── group
│   │   ├── ipsec.conf
│   │   ├── ipsec.secrets
│   │   ├── modules
│   │   ├── network
│   │   │   └── interfaces
│   │   ├── nftables.conf
│   │   ├── passwd
│   │   ├── radvd.conf
│   │   ├── resolv.conf
│   │   ├── ssh
│   │   │   └── sshd_config
│   │   ├── sysctl.conf
│   │   ├── systemd
│   │   │   └── system
│   │   │       ├── etc_bckp.service
│   │   │       ├── etc_bckp.timer
│   │   │       ├── isc-dhcp-server.service
│   │   │       ├── multi-user.target.wants
│   │   │       │   ├── chrony.service -> /etc/systemd/system/chrony.service
│   │   │       │   ├── frr.service -> /etc/systemd/system/frr.service
│   │   │       │   ├── isc-dhcp-server.service -> /etc/systemd/system/isc-dhcp-server.service
│   │   │       │   ├── named.service -> /etc/systemd/system/named.service
│   │   │       │   ├── radvd.service -> /etc/systemd/system/radvd.service
│   │   │       │   └── strongswan-starter.service -> /etc/systemd/system/strongswan-starter.service
│   │   │       └── timers.target.wants
│   │   │           └── etc_bckp.timer -> /etc/systemd/system/etc_bckp.timer
│   │   └── timezone
│   ├── home
│   │   ├── ivanadm
│   │   └── network-admin
│   └── root
│       └── etc_bckp.sh
├── HQ-R-req.txt
├── HQ-SRV
│   ├── etc
│   │   ├── gai.conf
│   │   ├── group
│   │   ├── network
│   │   │   └── interfaces
│   │   ├── nftables.conf
│   │   ├── passwd
│   │   ├── ssh
│   │   │   └── sshd_config
│   │   ├── systemd
│   │   │   ├── system
│   │   │   │   └── systemd-networkd-wait-online.service
│   │   │   └── timesyncd.conf
│   │   └── timezone
│   ├── home
│   │   ├── admin
│   │   └── ivanadm
│   └── root
├── HQ-SRV-req.txt
├── ISP
│   ├── etc
│   │   ├── gai.conf
│   │   ├── group
│   │   ├── modules
│   │   ├── network
│   │   │   └── interfaces
│   │   ├── nftables.conf
│   │   ├── passwd
│   │   ├── ssh
│   │   │   └── sshd_config
│   │   ├── sysctl.conf
│   │   ├── systemd
│   │   │   └── system
│   │   └── timezone
│   ├── home
│   │   └── ivanadm
│   └── root
└── ISP-req.txt
</pre>
<br>

**Finished modules:**
- [x] Module 1:
  - [x] 1.1 VirtualBox adapters + vms interface configurations
  - [x] 1.2 IPSec / GRE ipv4 tunnel + OSPFV2 / OSPFV3
  - [x] 1.3 Internal DHCP + DHCP6 on HQ-R
  - [x] 1.4 Local Users
  - [x] 1.5 iperf3 results
  - [x] 1.6 /etc backup scripts
  - [x] 1.7 SSH setup
  - [x] 1.8 nftables inet filter
- [ ] Module 2:
  - [x] 2.0 nftables NAT
  - [x] 2.1 bind9 setup
  - [x] 2.2 NTP setup
  - [ ] 2.3 Samba domain
  - [ ] 2.4 NFS/SMB
  - [ ] 2.5 LAMP stack
  - [ ] 2.6 MediaWiki + docker
- [ ] Module 3
qwer
