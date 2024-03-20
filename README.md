<h1 align="center">DEMO EXAM </h1>
<h3 align="center">this repo contains all source configs for demonstration exam</h3>
<p>based on https://sysahelper.ru/course/view.php?id=10#section-0</p>
<br>
<br>
<h3 align="center">================== ALT-LINUX VERSION ==================</h3>
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
bind-utils
nftables
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
- [ ] Module 1:
  - [ ] 1.1 VirtualBox adapters + vms interface configurations
  - [ ] 1.2 IPSec / GRE ipv4 tunnel + OSPFV2 / OSPFV3
  - [ ] 1.3 Internal DHCP + DHCP6 on HQ-R
  - [ ] 1.4 Local Users
  - [ ] 1.5 iperf3 results
  - [ ] 1.6 /etc backup scripts
  - [ ] 1.7 SSH setup
  - [ ] 1.8 nftables inet filter
- [ ] Module 2:
  - [ ] 2.0 nftables NAT
  - [ ] 2.1 bind9 setup
  - [ ] 2.2 NTP setup
  - [ ] 2.3 Samba domain
  - [ ] 2.4 NFS/SMB
  - [ ] 2.5 LAMP stack
  - [ ] 2.6 MediaWiki + docker
- [ ] Module 3
qwer
