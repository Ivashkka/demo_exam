<h1 align="center">DEMO EXAM </h1>
<h3 align="center">this repo contains all source configs for demonstration exam</h3>
<p>based on https://sysahelper.ru/course/view.php?id=10#section-0</p>
<br>
<br>
<h3 align="center">================== ALT-LINUX VERSION ==================</h3>
<br>
<p><b>АВТОНАСТРОЙКА ХОСТА:</b></p>
<p>зайдите под рутом</p>
<p><code>su -</code></p>
<p>перейдите в домашнюю дирректорию</p>
<p><code>cd ~</code></p>
<p>установите git и make:</p>
<p><code>apt-get install git make</code></p>
<p>склонируйте репозиторий:</p>
<p><code>git clone https://github.com/Ivashkka/demo_exam.git</code></p>
<p>перейдите внутрь репозитория:</p>
<p><code>cd demo_exam</code></p>
<p>переключитесь на ветку altlinux:</p>
<p><code>git checkout altlinux</code></p>
<p>измените имя хоста:</p>
<p><code>hostnamectl set-hostname NAME</code></p>
<p>запустите установочный скрипт:</p>
<p><code>make install</code></p>
<p>следуйте инструкциям</p>
<br>
<p><b>AUTO CONFIGURE HOST:</b></p>
<p>login as root</p>
<p><code>su -</code></p>
<p>locate inside home dirrectory</p>
<p><code>cd ~</code></p>
<p>install git and make</p>
<p><code>apt-get install git make</code></p>
<p>clone repo to linux machine:</p>
<p><code>git clone https://github.com/Ivashkka/demo_exam.git</code></p>
<p>move inside:</p>
<p><code>cd demo_exam</code></p>
<p>checkout to altlinux:</p>
<p><code>git checkout altlinux</code></p>
<p>change hostname:</p>
<p><code>hostnamectl set-hostname NAME</code></p>
<p>start autoconfigure script:</p>
<p><code>make install</code></p>
<p>follow the instructions</p>
<br>
<p><b>all apt package requirements:</b></p>
<pre>
packages:
  - name: net-tools
    hosts: ALL
    task: 0
  - name: bind-utils
    hosts: ALL
    task: 0
  - name: nano
    hosts: ALL
    task: 0
  - name: nftables
    hosts: ALL
    task: 0
    units: [nftables.service]
  - name: openssh-server
    hosts: ALL
    task: 0
    units: [sshd.service]
  - name: NetworkManager
    hosts: ALL
    task: 0
    units: [NetworkManager.service]
  - name: NetworkManager-tui
    hosts: ALL
    task: 0
  - name: frr
    hosts: [HQ-R, BR-R]
    task: 1.2
    units: [frr.service]
  - name: strongswan
    hosts: [HQ-R, BR-R]
    task: 1.2
    units: [ipsec.service]
  - name: dhcp-server
    hosts: [HQ-R]
    task: 1.3
    units: [dhcpd.service, dhcpd6.service]
  - name: radvd
    hosts: [HQ-R]
    task: 1.3
    units: [radvd.service]
  - name: iperf3
    hosts: [HQ-R, ISP]
    task: 1.5
  - name: etc-bckp
    hosts: [HQ-R, BR-R]
    task: 1.6
    install: None
    units: [etc_bckp.timer]
</pre>
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
│   └── empty.txt
├── BR-R-req.txt
├── BR-SRV
│   └── empty.txt
├── BR-SRV-req.txt
├── CLI
│   └── empty.txt
├── CLI-req.txt
├── HQ-R
│   └── empty.txt
├── HQ-R-req.txt
├── HQ-SRV
│   └── empty.txt
├── HQ-SRV-req.txt
├── ISP
│   └── empty.txt
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
  - [ ] 2.1 bind9 setup
  - [ ] 2.2 NTP setup
  - [ ] 2.3 Samba domain
  - [ ] 2.4 NFS/SMB
  - [ ] 2.5 LAMP stack
  - [ ] 2.6 MediaWiki + docker
- [ ] Module 3
qwer
